import 'dart:convert';

class WalkingResponse {
    final List<Route> routes;
    final List<Waypoint> waypoints;
    final String code;
    final String uuid;

    WalkingResponse({
        required this.routes,
        required this.waypoints,
        required this.code,
        required this.uuid,
    });

    factory WalkingResponse.fromRawJson(String str) => WalkingResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory WalkingResponse.fromJson(Map<String, dynamic> json) => WalkingResponse(
        routes: List<Route>.from(json["routes"].map((x) => Route.fromJson(x))),
        waypoints: List<Waypoint>.from(json["waypoints"].map((x) => Waypoint.fromJson(x))),
        code: json["code"],
        uuid: json["uuid"],
    );

    Map<String, dynamic> toJson() => {
        "routes": List<dynamic>.from(routes.map((x) => x.toJson())),
        "waypoints": List<dynamic>.from(waypoints.map((x) => x.toJson())),
        "code": code,
        "uuid": uuid,
    };
}

class Route {
    final String weightName;
    final double weight;
    final double duration;
    final double distance;
    final List<Leg> legs;
    final String geometry;

    Route({
        required this.weightName,
        required this.weight,
        required this.duration,
        required this.distance,
        required this.legs,
        required this.geometry,
    });

    factory Route.fromRawJson(String str) => Route.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Route.fromJson(Map<String, dynamic> json) => Route(
        weightName: json["weight_name"],
        weight: json["weight"]?.toDouble(),
        duration: json["duration"]?.toDouble(),
        distance: json["distance"]?.toDouble(),
        legs: List<Leg>.from(json["legs"].map((x) => Leg.fromJson(x))),
        geometry: json["geometry"],
    );

    Map<String, dynamic> toJson() => {
        "weight_name": weightName,
        "weight": weight,
        "duration": duration,
        "distance": distance,
        "legs": List<dynamic>.from(legs.map((x) => x.toJson())),
        "geometry": geometry,
    };
}

class Leg {
    final List<dynamic> viaWaypoints;
    final List<Admin> admins;
    final double weight;
    final double duration;
    final List<dynamic> steps;
    final double distance;
    final String summary;

    Leg({
        required this.viaWaypoints,
        required this.admins,
        required this.weight,
        required this.duration,
        required this.steps,
        required this.distance,
        required this.summary,
    });

    factory Leg.fromRawJson(String str) => Leg.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Leg.fromJson(Map<String, dynamic> json) => Leg(
        viaWaypoints: List<dynamic>.from(json["via_waypoints"].map((x) => x)),
        admins: List<Admin>.from(json["admins"].map((x) => Admin.fromJson(x))),
        weight: json["weight"]?.toDouble(),
        duration: json["duration"]?.toDouble(),
        steps: List<dynamic>.from(json["steps"].map((x) => x)),
        distance: json["distance"]?.toDouble(),
        summary: json["summary"],
    );

    Map<String, dynamic> toJson() => {
        "via_waypoints": List<dynamic>.from(viaWaypoints.map((x) => x)),
        "admins": List<dynamic>.from(admins.map((x) => x.toJson())),
        "weight": weight,
        "duration": duration,
        "steps": List<dynamic>.from(steps.map((x) => x)),
        "distance": distance,
        "summary": summary,
    };
}

class Admin {
    final String iso31661Alpha3;
    final String iso31661;

    Admin({
        required this.iso31661Alpha3,
        required this.iso31661,
    });

    factory Admin.fromRawJson(String str) => Admin.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        iso31661Alpha3: json["iso_3166_1_alpha3"],
        iso31661: json["iso_3166_1"],
    );

    Map<String, dynamic> toJson() => {
        "iso_3166_1_alpha3": iso31661Alpha3,
        "iso_3166_1": iso31661,
    };
}

class Waypoint {
    final double distance;
    final String name;
    final List<double> location;

    Waypoint({
        required this.distance,
        required this.name,
        required this.location,
    });

    factory Waypoint.fromRawJson(String str) => Waypoint.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Waypoint.fromJson(Map<String, dynamic> json) => Waypoint(
        distance: json["distance"]?.toDouble(),
        name: json["name"],
        location: List<double>.from(json["location"].map((x) => x?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "distance": distance,
        "name": name,
        "location": List<dynamic>.from(location.map((x) => x)),
    };
}
