part of 'ihome_remote.dart';

@Injectable(as: IHomeRemoteSource)
class HomeRemoteSource extends IHomeRemoteSource {
  @override
  Future<Either<AppErrors, EmptyResponse>> testFailure(
      MockRequest mockRequest) {
    return request<EmptyResponse>(
      converter: (json) => EmptyResponse.fromMap(json),
      method: HttpMethod.POST,
      url: "",
      body: mockRequest.toMap(),
      cancelToken: mockRequest.cancelToken,
    );
  }

  @override
  Future<Either<AppErrors, EmptyResponse>> testSuccess(
      MockRequest mockRequest) {
    return request<EmptyResponse>(
      converter: (json) => EmptyResponse.fromMap(json),
      method: HttpMethod.POST,
      url: "",
      body: mockRequest.toMap(),
      cancelToken: mockRequest.cancelToken,
    );
  }

  @override
  Future<Either<AppErrors, EmptyResponse>> testValidator(
      MockRequest mockRequest) {
    return request<EmptyResponse>(
      converter: (json) => EmptyResponse.fromMap(json),
      method: HttpMethod.POST,
      url: "",
      body: mockRequest.toMap(),
      cancelToken: mockRequest.cancelToken,
      responseValidator: TestResponseValidator(),
    );
  }

  @override
  Future<Either<AppErrors, PeopleDataModel>> getPeople(
      MockRequest mockRequest) {
    return request<PeopleDataModel>(
      converter: (json) => PeopleDataModel.fromMap(json),
      method: HttpMethod.POST,
      url: "",
      body: mockRequest.toMap(),
      cancelToken: mockRequest.cancelToken,
    );
  }

  @override
  Future<Either<AppErrors, List<CommentsModel>>> getComments() {
    return listRequest<CommentsModel>(
      converter: (json) => CommentsModel.fromJson(json),
      method: HttpMethod.GET,
      url: APIUrls.API_JP_COMMENTS,
      baseUrl: APIUrls.BASE_JSON_PLACEHOLDER,
    );
  }

  /////////////

  @override
  Future<Either<AppErrors, List<PostModel>>> getPosts(NoParams params) async {
    var document =
        await FirebaseFirestore.instance.collection('posts').doc('posts');
    try {
      final postsDoc = await document.get();
      final postsData = postsDoc.data();
      if (postsData == null) {
        return left(const AppErrors.internalServerWithDataError(
          500,
          type: ErrorCodeType.Unkown,
          message: "Posts data is null",
        ));
      }

      final items = listV(postsData['items']);

      List<PostModel> posts =
          List<PostModel>.from(items.map((post) => PostModel.fromMap(post)));
      return right(posts);
    } catch (e) {
      return left(
        const AppErrors.internalServerWithDataError(
          500,
          type: ErrorCodeType.Unkown,
          message: "Unknown error",
        ),
      );
    }
  }

  @override
  Future<Either<AppErrors, List<StoryModel>>> getStories(
      NoParams params) async {
    var document =
        await FirebaseFirestore.instance.collection('stories').doc('stories');
    try {
      final storiesDoc = await document.get();
      final storiesData = storiesDoc.data();
      if (storiesData == null) {
        return left(const AppErrors.internalServerWithDataError(
          500,
          type: ErrorCodeType.Unkown,
          message: "Stories data is null",
        ));
      }
      final items = listV(storiesData['items']);
      List<StoryModel> stories = List<StoryModel>.from(
          items.map((story) => StoryModel.fromMap(story)));
      return right(stories);
    } catch (e) {
      return left(
        AppErrors.internalServerWithDataError(
          500,
          type: ErrorCodeType.Unkown,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<AppErrors, ProfileModel>> getProfile(NoParams params) async {
    var document = await FirebaseFirestore.instance
        .collection('profile')
        .doc('my_profile');
    try {
      final myProfileDoc = await document.get();
      final profileData = myProfileDoc.data();
      if (profileData == null) {
        return left(const AppErrors.internalServerWithDataError(
          500,
          type: ErrorCodeType.Unkown,
          message: "Profile data is null",
        ));
      }
      ProfileModel profile = ProfileModel.fromJson(profileData);
      return right(profile);
    } catch (e) {
      return left(
        const AppErrors.internalServerWithDataError(
          500,
          type: ErrorCodeType.Unkown,
          message: "unknown error",
        ),
      );
    }
  }
}
