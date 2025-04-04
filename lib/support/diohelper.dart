import 'package:apiprovider/core/constant/constant.dart';
import 'package:dio/dio.dart';

class Diohelper {
  Dio dio = Dio(BaseOptions(baseUrl: baseUrl));
}
