import 'package:goods_belt/core/data/data_sources/fakeapi_service.dart';
import 'package:goods_belt/core/data/requests/login_request.dart';
import 'package:goods_belt/features/auth/data/dto/tokens_dto.dart';

class AuthDataSource {
  final FakeapiService _fakeapiService = FakeapiService();

  Future<TokensDto?> doLogin(String email, String password) async {
    try {
      final response = await _fakeapiService.login(LoginRequest(email: email, password: password));
      return TokensDto.fromApi(response.data);
    } on Exception catch (e) {
      print("error $e");
      return null;
    }
  }
}