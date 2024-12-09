class ProfileEntity {
  final String email;
  final String name;
  final String avatar;

  ProfileEntity({required this.email, required this.name, required this.avatar});
  ProfileEntity.empty() : email = '', name = '', avatar = '';
}