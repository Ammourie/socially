part of 'ihome_repository.dart';

@Injectable(as: IHomeRepository)
class HomeRepository extends IHomeRepository {
  final IHomeRemoteSource remoteDataSource;
  final IHomeLocalSource localDataSource;

  HomeRepository(this.remoteDataSource, this.localDataSource);

  @override
  Future<Result<AppErrors, EmptyResponse>> testFailure(
      MockRequest mockRequest) async {
    final remote = await remoteDataSource.testFailure(mockRequest);
    return remote.result<EmptyResponse>();
  }

  @override
  Future<Result<AppErrors, EmptyResponse>> testSuccess(
      MockRequest mockRequest) async {
    final remote = await remoteDataSource.testSuccess(mockRequest);
    return remote.result<EmptyResponse>();
  }

  @override
  Future<Result<AppErrors, EmptyResponse>> testValidator(
      MockRequest mockRequest) async {
    final remote = await remoteDataSource.testValidator(mockRequest);
    return remote.result<EmptyResponse>();
  }

  @override
  Future<Result<AppErrors, PeopleDataEntity>> getPeople(
      MockRequest mockRequest) async {
    final remote = await remoteDataSource.getPeople(mockRequest);
    return remote.result<PeopleDataEntity>();
  }

  @override
  Future<Result<AppErrors, List<CommentsEntity>>> getComments() async {
    final remote = await remoteDataSource.getComments();
    return executeForList<CommentsModel, CommentsEntity>(remoteResult: remote);
  }

  @override
  Future<Result<AppErrors, List<PostEntity>>> getPosts(
      NoParams noParams) async {
    if (await Utils.hasInternetConnection()) {
      final remote = await remoteDataSource.getPosts(noParams);
      return executeForList<PostModel, PostEntity>(remoteResult: remote);
    } else {
      final local = await localDataSource.getPosts(noParams);
      return executeForList<PostModel, PostEntity>(remoteResult: local);
    }
  }

  @override
  Future<Result<AppErrors, List<StoryEntity>>> getStories(
      NoParams noParams) async {
    if (await Utils.hasInternetConnection()) {
      final remote = await remoteDataSource.getStories(noParams);
      return executeForList<StoryModel, StoryEntity>(remoteResult: remote);
    } else {
      final local = await localDataSource.getStories(noParams);
      return executeForList<StoryModel, StoryEntity>(remoteResult: local);
    }
  }

  @override
  Future<Result<AppErrors, ProfileEntity>> getProfile(NoParams noParams) async {
    if (await Utils.hasInternetConnection()) {
      final remote = await remoteDataSource.getProfile(noParams);
      return execute(remoteResult: remote);
    } else {
      final local = await localDataSource.getProfile(noParams);
      return execute(remoteResult: local);
    }
  }
}
