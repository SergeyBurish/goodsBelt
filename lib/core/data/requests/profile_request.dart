class ProfileRequest {
  final String accessToken;

  ProfileRequest({required this.accessToken});
  
  Map<String, String> headers() {
    return {
      'Authorization': "Bearer $accessToken",};
  }
}