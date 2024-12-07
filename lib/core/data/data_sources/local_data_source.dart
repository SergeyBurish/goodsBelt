import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  final SharedPreferencesAsync _prefs = SharedPreferencesAsync();
  LocalDataSource._();

  static final LocalDataSource _instance = LocalDataSource._();
  factory LocalDataSource() => _instance;

  // static LocalDataSource? _instance;

  // static Future<LocalDataSource> get instance async {
  //   if (_instance != null) {
  //     return _instance!;
  //   }
    
  //   SharedPreferencesWithCache prefs = await SharedPreferencesWithCache.create(
  //     cacheOptions: const SharedPreferencesWithCacheOptions(
  //       allowList: <String>{'goodsBeltAccessToken', 'goodsBeltRefreshToken'},
  //     ),
  //   );
  //   _instance = LocalDataSource._(prefs);
  //   return _instance!;
  // }

  Future<void> saveTokens({required String accessToken, required String refreshToken}) async {
    await _prefs.setString('goodsBeltAccessToken', accessToken);
    await _prefs.setString('goodsBeltRefreshToken', refreshToken);
  }

  Future<({String? accessToken, String? refreshToken})> getTokens() async {
    String? accessToken = await _prefs.getString('goodsBeltAccessToken');
    String? refreshToken = await _prefs.getString('goodsBeltRefreshToken');
    return (accessToken: accessToken, refreshToken: refreshToken);
  }
}