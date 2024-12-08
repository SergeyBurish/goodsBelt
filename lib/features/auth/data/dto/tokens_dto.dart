class TokensDto {
  final String? accessToken;
  final String? refreshToken;

  TokensDto.fromApi(Map<String, dynamic> record) : 
    accessToken = record['access_token'],
    refreshToken = record['refresh_token'];
}