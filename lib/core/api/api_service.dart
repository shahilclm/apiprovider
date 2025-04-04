import 'package:apiprovider/core/api/endpoints.dart';
import 'package:apiprovider/support/diohelper.dart';
import 'package:dio/dio.dart';

class ApiService {
  Diohelper diohelper = Diohelper();
  Future<List<dynamic>> fetchProduct() async {
    Response response = await diohelper.dio.get(Endpoints.hotCofee);
    print(response);
    return response.data;
  }

  Future<List<dynamic>> fetchHotProduct() async {
    Response response = await diohelper.dio.get(Endpoints.icedCofee);
    print(response);
    return response.data;
  }
}
