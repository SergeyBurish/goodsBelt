import 'package:goods_belt/features/auth/data/data_sources/auth_data_source.dart';
import 'package:goods_belt/features/auth/domain/usecase/auth_usecase.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepositoryImp(): _authDataSource = AuthDataSource();

  @override
  Future<void> doLogin(String email, String password) async {
    _authDataSource.doLogin(email, password);
  }
}