import 'package:socially/core/common/extensions/base_model_list_extension.dart';
import 'package:socially/features/home/data/request/model/story_model.dart';

import '../../../../../core/common/type_validators.dart';
import '../../../../../core/models/base_model.dart';
import '../../../domain/entity/post_entity.dart';

class PostModel extends BaseModel<PostEntity> {
  final int? id;
  final String userImage;
  final String userName;
  final String content;
  final int? likes;
  final List<String> comments;
  final DateTime? createdAt;
  final List<MediaModel> mediaList;
  PostModel({
    required this.id,
    required this.userImage,
    required this.userName,
    required this.content,
    required this.likes,
    required this.comments,
    required this.createdAt,
    required this.mediaList,
  });

  @override
  PostEntity toEntity() {
    return PostEntity(
      id: id,
      userImage: userImage,
      userName: userName,
      content: content,
      likes: likes,
      comments: comments,
      createdAt: createdAt,
      mediaList: mediaList.toListEntity(),
    );
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: numV(map['id']),
      userImage: stringV(map['userImage']),
      userName: stringV(map['userName']),
      content: stringV(map['content']),
      likes: numV(map['likes']),
      comments: listV(map['comments']),
      createdAt: dateTimeV(map['createdAt']),
      mediaList:
          listV(map['mediaList']).map((e) => MediaModel.fromMap(e)).toList(),
    );
  }
}
