import 'package:goods_belt/features/auth/data/dto/profile_dto.dart';
import 'package:goods_belt/features/auth/domain/entity/profile_entity.dart';

class ProfileMapper {
  static ProfileEntity? fromDto(ProfileDto profileDto) {
    if (profileDto.email != null && profileDto.email!.isNotEmpty &&
    profileDto.name != null && profileDto.name!.isNotEmpty) {
      return ProfileEntity(
        email: profileDto.email!, 
        name: profileDto.name!, 
        avatar: profileDto.avatar ?? ''
      );
    }
    return null;
  }
}