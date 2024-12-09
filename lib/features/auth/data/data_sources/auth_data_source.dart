import 'package:goods_belt/core/data/data_sources/fakeapi_service.dart';
import 'package:goods_belt/core/data/requests/login_request.dart';
import 'package:goods_belt/core/data/requests/profile_request.dart';
import 'package:goods_belt/core/data/requests/refresh_tokens_request.dart';
import 'package:goods_belt/features/auth/data/dto/profile_dto.dart';
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

  Future<TokensDto?> refreshTokens(String refreshToken) async {
    try {
      final response = await _fakeapiService.refreshTokens(RefreshTokensRequest(refreshToken: refreshToken));
      return TokensDto.fromApi(response.data);
    } on Exception catch (e) {
      print("error $e");
      return null;
    }
  }

  Future<ProfileDto?> getProfile(String accessToken) async {
    try {
      final response = await _fakeapiService.getProfile(ProfileRequest(accessToken: accessToken));
      return ProfileDto.fromApi(response.data);
    } on Exception catch (e) {
      print("error $e");
      return null;
    }
  }
}