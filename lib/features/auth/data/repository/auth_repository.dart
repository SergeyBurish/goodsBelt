import 'package:goods_belt/core/data/data_sources/local_data_source.dart';
import 'package:goods_belt/features/auth/data/data_sources/auth_data_source.dart';
import 'package:goods_belt/features/auth/domain/entity/tokens_entity.dart';
import 'package:goods_belt/features/auth/domain/usecase/auth_usecase.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepositoryImp(): _authDataSource = AuthDataSource();

  @override
  Future<TokensEntity?> doLogin(String email, String password) async {
    final tokensDto = await _authDataSource.doLogin(email, password);

    if(tokensDto != null && 
    tokensDto.accessToken != null && tokensDto.accessToken!.isNotEmpty &&
    tokensDto.refreshToken != null && tokensDto.refreshToken!.isNotEmpty
    ) {
      return TokensEntity(accessToken: tokensDto.accessToken!, refreshToken: tokensDto.refreshToken!);
    }

    return null;
  }

  @override
  Future<({String? accessToken, String? refreshToken})> getTokens() async => 
    await LocalDataSource().getTokens();
  
  @override
  Future<void> saveTokens({required String accessToken, required String refreshToken}) async => 
    await LocalDataSource().saveTokens(accessToken: accessToken, refreshToken: refreshToken);
}