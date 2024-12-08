import 'package:goods_belt/features/auth/domain/entity/tokens_entity.dart';

abstract interface class AuthManager {
  Future<bool> login(String email, String password);
  Future<bool> refreshTocken();
}

abstract interface class AuthRepository {
  Future<TokensEntity?> doLogin(String email, String password);
  Future<TokensEntity?> refreshTokens({required String refreshToken});
  Future<({String? accessToken, String? refreshToken})> getTokens();
  Future<void> saveTokens({required String accessToken, required String refreshToken});
}

class AuthUsecase {
  static late final _AuthUsecaseImp _authUsecaseImp;

  static init(AuthRepository repository) {
    _authUsecaseImp = _AuthUsecaseImp(repository: repository);
  }

  static AuthManager get authManager => _authUsecaseImp;
}

class _AuthUsecaseImp implements AuthManager {
  final AuthRepository repository;

  _AuthUsecaseImp({required this.repository});

  @override
  Future<bool> login(String email, String password) async {
    final TokensEntity? tokensEntity = await repository.doLogin(email, password);
    if (tokensEntity == null) {
      return false;
    }
    await repository.saveTokens(accessToken: tokensEntity.accessToken, refreshToken: tokensEntity.refreshToken);
    return true;
  }
  
  @override
  Future<bool> refreshTocken() async {
    final tokens = await repository.getTokens();
    if(tokens.accessToken == null || tokens.refreshToken == null) {
      return false;
    }

    final TokensEntity? tokensEntity = await repository.refreshTokens(refreshToken: tokens.refreshToken!);
    if (tokensEntity == null) {
      return false;
    }
    await repository.saveTokens(accessToken: tokensEntity.accessToken, refreshToken: tokensEntity.refreshToken);
    return true;
  }
}