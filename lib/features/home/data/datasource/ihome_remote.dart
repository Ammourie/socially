import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:socially/core/common/type_validators.dart';
import 'package:socially/core/params/no_params.dart';

import '../../../../core/constants/enums/error_code_type.dart';
import '../../../../core/constants/enums/http_method.dart';
import '../../../../core/datasources/remote_data_source.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/models/empty_response.dart';
import '../../../../core/net/api_url.dart';
import '../../../../core/net/response_validators/test_response_validator.dart';
import '../request/model/comments_model.dart';
import '../request/model/people_model.dart';
import '../request/model/post_model.dart';
import '../request/model/profile_model.dart';
import '../request/model/story_model.dart';
import '../request/param/mock_request.dart';

part 'home_remote.dart';

abstract class IHomeRemoteSource extends RemoteDataSource {
  /// Test APIs
  Future<Either<AppErrors, EmptyResponse>> testSuccess(MockRequest mockRequest);
  Future<Either<AppErrors, EmptyResponse>> testFailure(MockRequest mockRequest);
  Future<Either<AppErrors, EmptyResponse>> testValidator(
      MockRequest mockRequest);
  Future<Either<AppErrors, PeopleDataModel>> getPeople(MockRequest mockRequest);
  Future<Either<AppErrors, List<CommentsModel>>> getComments();
  //////
  Future<Either<AppErrors, List<PostModel>>> getPosts(NoParams params);
  Future<Either<AppErrors, List<StoryModel>>> getStories(NoParams params);
  Future<Either<AppErrors, ProfileModel>> getProfile(NoParams params);
}
