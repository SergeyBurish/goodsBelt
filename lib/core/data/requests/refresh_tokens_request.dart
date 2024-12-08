class RefreshTokensRequest {
  final String refreshToken;

  RefreshTokensRequest({required this.refreshToken});

  Map<String, String> data() {
    return {
      'refreshToken': refreshToken,};
  }
}