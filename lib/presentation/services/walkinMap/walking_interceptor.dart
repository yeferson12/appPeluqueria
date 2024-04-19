import 'package:dio/dio.dart';

const accessToken = 'pk.eyJ1IjoieWVmZXJzb24iLCJhIjoiY2tnaWhja21oMDZxczJycGV4Z3VldGk5dSJ9.eMtMMBt_oja_Ud8anHB-gg';

class WalkingInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    
    options.queryParameters.addAll({
      'alternatives': true,
      'continue_straight': true,
      'geometries': 'polyline6',
      'overview': 'simplified',
      'steps': false,
      'access_token': accessToken
    });


    super.onRequest(options, handler);
  }


}