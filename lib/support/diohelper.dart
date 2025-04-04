import 'package:apiprovider/core/constant/constant.dart';
import 'package:dio/dio.dart';

class Diohelper {
  Dio dio = Dio(BaseOptions(baseUrl: baseUrl));
  Diohelper() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add any request interceptors here
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // Add any response interceptors here
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          // Handle errors here
          return handler.next(e);
        },
      ),
    );
  }
}
