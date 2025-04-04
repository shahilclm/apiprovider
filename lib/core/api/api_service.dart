import 'package:apiprovider/support/diohelper.dart';
import 'package:dio/dio.dart';

class ApiService {
  Diohelper diohelper = Diohelper();
  Future<List<dynamic>> fetchProduct() async {
    try {
      Response response = await diohelper.dio.get('/coffee/hot');
      return response.data;
    } catch (e) {}
  }
}
