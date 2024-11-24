part of 'ihome_local.dart';

@Injectable(as: IHomeLocalSource)
class HomeLocalSource extends IHomeLocalSource {
  @override
  Future<Either<AppErrors, List<PostModel>>> getPosts(NoParams params) async {
    try {
      var box = await Hive.openBox('posts');
      final items = json.decode(json.encode(box.get('posts')));
      if (items == null) {
        return left(const AppErrors.internalServerWithDataError(
          500,
          type: ErrorCodeType.Unkown,
          message: "Posts data is null",
        ));
      }
      List<PostModel> posts =
          List<PostModel>.from(items.map((post) => PostModel.fromMap(post)));
      await box.close();
      return right(posts);
    } catch (e) {
      print(e);
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
    try {
      var box = await Hive.openBox('stories');
      final items = json.decode(json.encode(box.get('stories')));
      if (items == null) {
        return left(const AppErrors.internalServerWithDataError(
          500,
          type: ErrorCodeType.Unkown,
          message: "Stories data is null",
        ));
      }

      List<StoryModel> stories = List<StoryModel>.from(
          items.map((story) => StoryModel.fromMap(story)));
      await box.close();
      return right(stories);
    } catch (e) {
      print(e);
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
    try {
      var box = await Hive.openBox('profile');
      final profileData = box.get('my_profile');
      if (profileData == null) {
        print('Profile data is null');
        return left(const AppErrors.internalServerWithDataError(
          500,
          type: ErrorCodeType.Unkown,
          message: "Profile data is null",
        ));
      }
      final my_profile = json.decode(json.encode(profileData));

      ProfileModel profile = ProfileModel.fromJson(my_profile);
      await box.close();
      return right(profile);
    } catch (e) {
      print(e);
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
