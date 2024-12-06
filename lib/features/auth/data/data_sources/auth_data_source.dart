import 'package:goods_belt/core/data/data_sources/fakeapi_service.dart';
import 'package:goods_belt/core/data/requests/login_request.dart';

class AuthDataSource {
  final FakeapiService _fakeapiService;

  AuthDataSource(): _fakeapiService = FakeapiService() ;

  Future<void> doLogin(String email, String password) async {
    _fakeapiService.login(LoginRequest(email: email, password: password));
  }
}