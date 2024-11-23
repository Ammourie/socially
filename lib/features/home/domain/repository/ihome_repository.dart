import 'package:injectable/injectable.dart';

import '../../../../core/common/extensions/either_error_model_extension.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/models/empty_response.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/repositories/repository.dart';
import '../../../../core/results/result.dart';
import '../../data/datasource/ihome_remote.dart';
import '../../data/request/model/comments_model.dart';
import '../../data/request/model/post_model.dart';
import '../../data/request/model/story_model.dart';
import '../../data/request/param/mock_request.dart';
import '../entity/comments_entity.dart';
import '../entity/people_entity.dart';
import '../entity/post_entity.dart';
import '../entity/story_entity.dart';

part 'home_repository.dart';

abstract class IHomeRepository extends Repository {
  /// Test APIs
  Future<Result<AppErrors, EmptyResponse>> testSuccess(MockRequest mockRequest);
  Future<Result<AppErrors, EmptyResponse>> testFailure(MockRequest mockRequest);
  Future<Result<AppErrors, EmptyResponse>> testValidator(
      MockRequest mockRequest);
  Future<Result<AppErrors, PeopleDataEntity>> getPeople(
      MockRequest mockRequest);
  Future<Result<AppErrors, List<CommentsEntity>>> getComments();

  Future<Result<AppErrors, List<StoryEntity>>> getStories(NoParams noParams);
  Future<Result<AppErrors, List<PostEntity>>> getPosts(NoParams noParams);
}
