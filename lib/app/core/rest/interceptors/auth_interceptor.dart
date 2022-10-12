import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ui/global/global_context.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      Injector.get<GlobalContext>().loginExpire();
    } else {
      handler.next(err);
    }
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final sp = await SharedPreferences.getInstance();
    final accessToken = sp.getString('accessToken');
    log('token: $accessToken');
    options.headers['Authorization'] = 'Bearer $accessToken';

    handler.next(options); //! ATENÇÃO!!!!
    // super.onRequest(options, handler);
  }
}
