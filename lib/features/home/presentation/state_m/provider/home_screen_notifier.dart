import '../../../../../core/common/custom_modules/screen_notifier.dart';
import '../../../domain/entity/post_entity.dart';
import '../../../domain/entity/story_entity.dart';
import '../cubit/home_cubit.dart';

class HomeScreenNotifier extends ScreenNotifier {
  /// Fields

  final HomeCubit postsCubit = HomeCubit();
  final HomeCubit storiesCubit = HomeCubit();

  bool _isLoading = false;

  List<StoryEntity> _stories = [];
  List<PostEntity> _posts = [];

  // getters, setters
  List<StoryEntity> get stories => _stories;

  set stories(List<StoryEntity> value) {
    _stories = value;
    notifyListeners();
  }

  List<PostEntity> get posts => _posts;

  set posts(List<PostEntity> value) {
    _posts = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void getHomeData() {
    postsCubit.getPosts();
    storiesCubit.getStories();
  }

  @override
  void closeNotifier() {
    postsCubit.close();
    this.dispose();
  }
}
