import 'dart:convert';

class PlacesEndResponse {
    final String type;
    final List<FeatureEnd> features;
    final String attribution;

    PlacesEndResponse({
        required this.type,
        required this.features,
        required this.attribution,
    });

    factory PlacesEndResponse.fromRawJson(String str) => PlacesEndResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PlacesEndResponse.fromJson(Map<String, dynamic> json) => PlacesEndResponse(
        type: json["type"],
        features: List<FeatureEnd>.from(json["features"].map((x) => FeatureEnd.fromJson(x))),
        attribution: json["attribution"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "features": List<dynamic>.from(features.map((x) => x.toJson())),
        "attribution": attribution,
    };
}

class FeatureEnd {
    final String type;
    final String id;
    final GeometryEnd geometry;
    final PropertiesEnd properties;

    FeatureEnd({
        required this.type,
        required this.id,
        required this.geometry,
        required this.properties,
    });

    factory FeatureEnd.fromRawJson(String str) => FeatureEnd.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FeatureEnd.fromJson(Map<String, dynamic> json) => FeatureEnd(
        type: json["type"],
        id: json["id"],
        geometry: GeometryEnd.fromJson(json["geometry"]),
        properties: PropertiesEnd.fromJson(json["properties"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "geometry": geometry.toJson(),
        "properties": properties.toJson(),
    };
}

class GeometryEnd {
    final String type;
    final List<double> coordinates;

    GeometryEnd({
        required this.type,
        required this.coordinates,
    });

    factory GeometryEnd.fromRawJson(String str) => GeometryEnd.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GeometryEnd.fromJson(Map<String, dynamic> json) => GeometryEnd(
        type: json["type"],
        coordinates: List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
    };
}

class PropertiesEnd {
    final String mapboxId;
    final String featureType;
    final String fullAddress;
    final String name;
    final String namePreferred;
    final CoordinatesEnd coordinates;
    final String? placeFormatted;
    final ContextEnd context;
    final List<double>? bbox;

    PropertiesEnd({
        required this.mapboxId,
        required this.featureType,
        required this.fullAddress,
        required this.name,
        required this.namePreferred,
        required this.coordinates,
        this.placeFormatted,
        required this.context,
        this.bbox,
    });

    factory PropertiesEnd.fromRawJson(String str) => PropertiesEnd.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PropertiesEnd.fromJson(Map<String, dynamic> json) => PropertiesEnd(
        mapboxId: json["mapbox_id"],
        featureType: json["feature_type"],
        fullAddress: json["full_address"],
        name: json["name"],
        namePreferred: json["name_preferred"],
        coordinates: CoordinatesEnd.fromJson(json["coordinates"]),
        placeFormatted: json["place_formatted"],
        context: ContextEnd.fromJson(json["context"]),
        bbox: json["bbox"] == null ? [] : List<double>.from(json["bbox"]!.map((x) => x?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "mapbox_id": mapboxId,
        "feature_type": featureType,
        "full_address": fullAddress,
        "name": name,
        "name_preferred": namePreferred,
        "coordinates": coordinates.toJson(),
        "place_formatted": placeFormatted,
        "context": context.toJson(),
        "bbox": bbox == null ? [] : List<dynamic>.from(bbox!.map((x) => x)),
    };
}

class ContextEnd {
    final Address? address;
    final PostcodeEnd? street;
    final District? neighborhood;
    final PostcodeEnd? postcode;
    final District? place;
    final District? district;
    final RegionEnd? region;
    final CountryEnd country;

    ContextEnd({
        this.address,
        this.street,
        this.neighborhood,
        this.postcode,
        this.place,
        this.district,
        this.region,
        required this.country,
    });

    factory ContextEnd.fromRawJson(String str) => ContextEnd.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ContextEnd.fromJson(Map<String, dynamic> json) => ContextEnd(
        address: json["address"] == null ? null : Address.fromJson(json["address"]),
        street: json["street"] == null ? null : PostcodeEnd.fromJson(json["street"]),
        neighborhood: json["neighborhood"] == null ? null : District.fromJson(json["neighborhood"]),
        postcode: json["postcode"] == null ? null : PostcodeEnd.fromJson(json["postcode"]),
        place: json["place"] == null ? null : District.fromJson(json["place"]),
        district: json["district"] == null ? null : District.fromJson(json["district"]),
        region: json["region"] == null ? null : RegionEnd.fromJson(json["region"]),
        country: CountryEnd.fromJson(json["country"]),
    );

    Map<String, dynamic> toJson() => {
        "address": address?.toJson(),
        "street": street?.toJson(),
        "neighborhood": neighborhood?.toJson(),
        "postcode": postcode?.toJson(),
        "place": place?.toJson(),
        "district": district?.toJson(),
        "region": region?.toJson(),
        "country": country.toJson(),
    };
}

class Address {
    final String mapboxId;
    final String addressNumber;
    final String streetName;
    final String name;

    Address({
        required this.mapboxId,
        required this.addressNumber,
        required this.streetName,
        required this.name,
    });

    factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        mapboxId: json["mapbox_id"],
        addressNumber: json["address_number"],
        streetName: json["street_name"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "mapbox_id": mapboxId,
        "address_number": addressNumber,
        "street_name": streetName,
        "name": name,
    };
}

class CountryEnd {
    final String mapboxId;
    final String name;
    final String wikidataId;
    final String countryCode;
    final String countryCodeAlpha3;

    CountryEnd({
        required this.mapboxId,
        required this.name,
        required this.wikidataId,
        required this.countryCode,
        required this.countryCodeAlpha3,
    });

    factory CountryEnd.fromRawJson(String str) => CountryEnd.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CountryEnd.fromJson(Map<String, dynamic> json) => CountryEnd(
        mapboxId: json["mapbox_id"],
        name: json["name"],
        wikidataId: json["wikidata_id"],
        countryCode: json["country_code"],
        countryCodeAlpha3: json["country_code_alpha_3"],
    );

    Map<String, dynamic> toJson() => {
        "mapbox_id": mapboxId,
        "name": name,
        "wikidata_id": wikidataId,
        "country_code": countryCode,
        "country_code_alpha_3": countryCodeAlpha3,
    };
}

class District {
    final MapboxId? mapboxId;
    final Name? name;
    final WikidataId? wikidataId;

    District({
        this.mapboxId,
        this.name,
        this.wikidataId,
    });

    factory District.fromRawJson(String str) => District.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory District.fromJson(Map<String, dynamic> json) => District(
        mapboxId: mapboxIdValues.map[json["mapbox_id"]],
        name: nameValues.map[json["name"]],
        wikidataId: wikidataIdValues.map[json["wikidata_id"]],
    );

    Map<String, dynamic> toJson() => {
        "mapbox_id": mapboxIdValues.reverse[mapboxId],
        "name": nameValues.reverse[name],
        "wikidata_id": wikidataIdValues.reverse[wikidataId],
    };
}

enum MapboxId {
    D_X_JU_OM1_IE_H_BS_YZPW_QW_JZ,
    D_X_JU_OM1_IE_H_BS_YZP_F_KZ_ZJN0_E,
    D_X_JU_OM1_IE_H_BS_YZP_HZFNNN0_E
}

final mapboxIdValues = EnumValuesEnd({
    "dXJuOm1ieHBsYzpwQWJz": MapboxId.D_X_JU_OM1_IE_H_BS_YZPW_QW_JZ,
    "dXJuOm1ieHBsYzpFKzZJN0E": MapboxId.D_X_JU_OM1_IE_H_BS_YZP_F_KZ_ZJN0_E,
    "dXJuOm1ieHBsYzpHZFNNN0E": MapboxId.D_X_JU_OM1_IE_H_BS_YZP_HZFNNN0_E
});

enum Name {
    HUDSON_COUNTY,
    NEW_DURHAM,
    UNION_CITY
}

final nameValues = EnumValuesEnd({
    "Hudson County": Name.HUDSON_COUNTY,
    "New Durham": Name.NEW_DURHAM,
    "Union City": Name.UNION_CITY
});

enum WikidataId {
    Q490505,
    Q588834,
    Q7007038
}

final wikidataIdValues = EnumValuesEnd({
    "Q490505": WikidataId.Q490505,
    "Q588834": WikidataId.Q588834,
    "Q7007038": WikidataId.Q7007038
});

class PostcodeEnd {
    final String mapboxId;
    final String name;

    PostcodeEnd({
        required this.mapboxId,
        required this.name,
    });

    factory PostcodeEnd.fromRawJson(String str) => PostcodeEnd.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PostcodeEnd.fromJson(Map<String, dynamic> json) => PostcodeEnd(
        mapboxId: json["mapbox_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "mapbox_id": mapboxId,
        "name": name,
    };
}

class RegionEnd {
    final String mapboxId;
    final String name;
    final String wikidataId;
    final String? regionCode;
    final String? regionCodeFull;

    RegionEnd({
        required this.mapboxId,
        required this.name,
        required this.wikidataId,
        this.regionCode,
        this.regionCodeFull,
    });

    factory RegionEnd.fromRawJson(String str) => RegionEnd.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RegionEnd.fromJson(Map<String, dynamic> json) => RegionEnd(
        mapboxId: json["mapbox_id"],
        name: json["name"],
        wikidataId: json["wikidata_id"],
        regionCode: json["region_code"],
        regionCodeFull: json["region_code_full"],
    );

    Map<String, dynamic> toJson() => {
        "mapbox_id": mapboxId,
        "name": name,
        "wikidata_id": wikidataId,
        "region_code": regionCode,
        "region_code_full": regionCodeFull,
    };
}

class CoordinatesEnd {
    final double longitude;
    final double latitude;
    final String? accuracy;
    final List<RoutablePoint>? routablePoints;

    CoordinatesEnd({
        required this.longitude,
        required this.latitude,
        this.accuracy,
        this.routablePoints,
    });

    factory CoordinatesEnd.fromRawJson(String str) => CoordinatesEnd.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CoordinatesEnd.fromJson(Map<String, dynamic> json) => CoordinatesEnd(
        longitude: json["longitude"]?.toDouble(),
        latitude: json["latitude"]?.toDouble(),
        accuracy: json["accuracy"],
        routablePoints: json["routable_points"] == null ? [] : List<RoutablePoint>.from(json["routable_points"]!.map((x) => RoutablePoint.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "longitude": longitude,
        "latitude": latitude,
        "accuracy": accuracy,
        "routable_points": routablePoints == null ? [] : List<dynamic>.from(routablePoints!.map((x) => x.toJson())),
    };
}

class RoutablePoint {
    final String name;
    final double latitude;
    final double longitude;

    RoutablePoint({
        required this.name,
        required this.latitude,
        required this.longitude,
    });

    factory RoutablePoint.fromRawJson(String str) => RoutablePoint.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RoutablePoint.fromJson(Map<String, dynamic> json) => RoutablePoint(
        name: json["name"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
    };
}

class EnumValuesEnd<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValuesEnd(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
