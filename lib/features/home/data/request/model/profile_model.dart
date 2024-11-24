import 'package:socially/core/common/extensions/extensions.dart';
import 'package:socially/core/entities/base_entity.dart';
import 'package:socially/core/models/base_model.dart';
import 'package:socially/features/home/data/request/model/story_model.dart';
import 'package:socially/features/home/domain/entity/profile_entity.dart';
import 'package:socially/features/home/domain/entity/story_entity.dart';

import '../../../../../core/common/type_validators.dart';

class ProfileModel extends BaseModel<ProfileEntity> {
  final String userName;
  final String profileImage;
  final List<MediaModel> stories;
  ProfileModel({
    required this.userName,
    required this.profileImage,
    required this.stories,
  });

  @override
  ProfileEntity toEntity() {
    return ProfileEntity(
      userName: userName,
      profileImage: profileImage,
      stories: stories.toListEntity(),
    );
  }

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      userName: stringV(json['userName']),
      profileImage: stringV(json['profileImage']),
      stories:
          listV(json['stories']).map((e) => MediaModel.fromMap(e)).toList(),
    );
  }
}
