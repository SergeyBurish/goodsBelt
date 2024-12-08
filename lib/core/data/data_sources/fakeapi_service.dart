import 'package:dio/dio.dart';
import 'package:goods_belt/core/data/requests/login_request.dart';

class FakeapiService {
  FakeapiService._();
  static final FakeapiService _instance = FakeapiService._();
  factory FakeapiService() => _instance;

  static const _baseUrl = 'https://api.escuelajs.co/api/v1';
  final Dio _dio = Dio(
    BaseOptions(baseUrl: _baseUrl),
  );

  Future<Response<dynamic>> login(LoginRequest request) async {
    print("--------- POST request /auth/login");
    final response = await _dio.post(
      '/auth/login',
      data: request.data(),
    );
    print("--------- POST response /auth/login");
    print(response);
    return response;
  }

  Future<Response<dynamic>> getProductsList(String accessToken) async {
    print("--------- GET request /products");
    final response = await _dio.get(
      '/products',
      options: Options( headers: {"Authorization": "Bearer $accessToken",}, )
    );
    print("--------- GET response /products");
    print(response);
    return response;
  }
}