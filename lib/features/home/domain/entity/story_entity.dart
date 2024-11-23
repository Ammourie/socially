import '../../../../core/constants/enums/media_type.dart';
import '../../../../core/entities/base_entity.dart';

class StoryEntity extends BaseEntity {
  final int? id;
  final List<MediaEntity> media;
  final String title;
  final String subtitle;
  final String userName;
  final String userImage;
  final DateTime? createdAt;

  StoryEntity({
    required this.id,
    required this.media,
    required this.title,
    required this.subtitle,
    required this.userName,
    required this.userImage,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        media,
        title,
        subtitle,
        userName,
        userImage,
        createdAt,
      ];
}

class MediaEntity extends BaseEntity {
  final String url;
  final MediaType type;

  MediaEntity({
    required this.url,
    required this.type,
  });

  @override
  List<Object?> get props => [
        url,
        type,
      ];
}
