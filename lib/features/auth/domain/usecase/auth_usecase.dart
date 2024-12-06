abstract interface class AuthManager {
  Future<void> login(String email, String password);
}

abstract interface class AuthRepository {
  Future<void> doLogin(String email, String password);
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
}