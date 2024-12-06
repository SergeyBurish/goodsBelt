import 'package:dio/dio.dart';
import 'package:goods_belt/core/data/requests/login_request.dart';

class FakeapiService {
  static const _baseUrl = 'https://api.escuelajs.co/api/v1';
  final Dio _dio = Dio(
    BaseOptions(baseUrl: _baseUrl),
  );

  Future<void> login(LoginRequest request) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: request.data(),
      );
      print(response);

    } on Exception catch (e) {
      print("eror $e");
    }
  }
}