import '../../../../core/entities/base_entity.dart';
import 'story_entity.dart';

class PostEntity extends BaseEntity {
  final int? id;
  final String userImage;
  final String userName;
  final String content;
  final int? likes;
  final List<String> comments;
  final List<MediaEntity> mediaList;
  final DateTime? createdAt;

  PostEntity({
    required this.id,
    required this.userImage,
    required this.userName,
    required this.content,
    required this.likes,
    required this.comments,
    required this.mediaList,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        userImage,
        userName,
        content,
        likes,
        comments,
        mediaList,
        createdAt,
      ];
}
