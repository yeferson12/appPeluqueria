import 'package:dio/dio.dart';


class PlacesInterceptor extends Interceptor {
  
  final accessToken = 'pk.eyJ1IjoieWVmZXJzb24iLCJhIjoiY2tnaWhja21oMDZxczJycGV4Z3VldGk5dSJ9.eMtMMBt_oja_Ud8anHB-gg';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    
    options.queryParameters.addAll({
      'access_token': accessToken,
      'language': 'es'
    });


    super.onRequest(options, handler);
  }

}