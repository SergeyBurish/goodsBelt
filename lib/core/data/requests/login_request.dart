class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  Map<String, String> data() {
    return {
      'email': email,
      'password': password,};
  }
}