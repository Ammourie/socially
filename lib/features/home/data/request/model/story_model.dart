import 'package:socially/core/common/extensions/base_model_list_extension.dart';
import 'package:socially/core/models/base_model.dart';
import 'package:socially/features/home/domain/entity/story_entity.dart';

import '../../../../../core/common/type_validators.dart';
import '../../../../../core/constants/enums/media_type.dart';

class StoryModel extends BaseModel<StoryEntity> {
  final int? id;
  final List<MediaModel> media;
  final String title;
  final String subtitle;
  final String userName;
  final String userImage;
  final DateTime? createdAt;

  StoryModel({
    required this.id,
    required this.media,
    required this.title,
    required this.subtitle,
    required this.userName,
    required this.userImage,
    required this.createdAt,
  });

  @override
  StoryEntity toEntity() {
    return StoryEntity(
      id: id,
      media: media.toListEntity(),
      title: title,
      subtitle: subtitle,
      userName: userName,
      userImage: userImage,
      createdAt: createdAt,
    );
  }

  factory StoryModel.fromMap(Map<String, dynamic> map) {
    return StoryModel(
      id: numV(map['id']),
      media:
          listV(map['media']).map((item) => MediaModel.fromMap(item)).toList(),
      title: stringV(map['title']),
      subtitle: stringV(map['subtitle']),
      userName: stringV(map['userName']),
      userImage: stringV(map['userImage']),
      createdAt: dateTimeV(map['createdAt']),
    );
  }
}

class MediaModel extends BaseModel<MediaEntity> {
  final String url;
  final int? type;

  MediaModel({
    required this.url,
    required this.type,
  });

  @override
  MediaEntity toEntity() {
    return MediaEntity(
      url: url,
      type: MediaType.mapToType(type),
    );
  }

  factory MediaModel.fromMap(Map<String, dynamic> map) {
    return MediaModel(
      url: stringV(map['url']),
      type: numV(map['type']),
    );
  }
}
