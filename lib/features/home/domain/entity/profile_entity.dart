import 'package:socially/core/entities/base_entity.dart';
import 'package:socially/features/home/domain/entity/story_entity.dart';

class ProfileEntity extends BaseEntity {
  final String userName;
  final String profileImage;
  final List<MediaEntity> stories;
  ProfileEntity({
    required this.userName,
    required this.profileImage,
    required this.stories,
  });

  @override
  List<Object?> get props => [userName, profileImage, stories];
}
