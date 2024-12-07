abstract interface class AuthManager {
  Future<void> login(String email, String password);
  Future<bool> refreshTocken();
}

abstract interface class AuthRepository {
  Future<void> doLogin(String email, String password);
  Future<({String? accessToken, String? refreshToken})> getTokens();
  Future<void> saveTokens ({required String accessToken, required String refreshToken});
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
  Future<void> login(String email, String password) async {
    repository.doLogin(email, password);
  }
  
  @override
  Future<bool> refreshTocken() async {
    final tokens = await repository.getTokens();
    if(tokens.accessToken == null) {
      return false;
    }
    return true;
  }
}