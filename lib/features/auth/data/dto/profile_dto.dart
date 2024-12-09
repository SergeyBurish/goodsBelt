class ProfileDto {
  final String? email;
  final String? password;
  final String? name;
  final String? role;
  final String? avatar;

  ProfileDto.fromApi(Map<String, dynamic> record) : 
    email = record['email'],
    password = record['password'],
    name = record['name'],
    role = record['role'],
    avatar = record['avatar'];
}