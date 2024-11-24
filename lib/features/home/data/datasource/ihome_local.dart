import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:socially/core/params/no_params.dart';

import '../../../../core/constants/enums/error_code_type.dart';
import '../../../../core/datasources/remote_data_source.dart';
import '../../../../core/errors/app_errors.dart';

import '../request/model/post_model.dart';
import '../request/model/profile_model.dart';
import '../request/model/story_model.dart';

part 'home_local.dart';

abstract class IHomeLocalSource extends RemoteDataSource {
  Future<Either<AppErrors, List<PostModel>>> getPosts(NoParams params);
  Future<Either<AppErrors, List<StoryModel>>> getStories(NoParams params);
  Future<Either<AppErrors, ProfileModel>> getProfile(NoParams params);
}
