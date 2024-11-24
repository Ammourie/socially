import 'package:socially/core/common/custom_modules/screen_notifier.dart';

import '../../../domain/entity/profile_entity.dart';
import '../cubit/profile_cubit.dart';

class ProfileScreenNotifier extends ScreenNotifier {
  final ProfileCubit profileCubit = ProfileCubit();

  ///fields
  late ProfileEntity _profileEntity;

  ///getters and setters
  ProfileEntity get profileEntity => _profileEntity;
  set profileEntity(ProfileEntity value) {
    _profileEntity = value;
    notifyListeners();
  }

  ///methods
  void getProfile() async {
    profileCubit.getProfile();
  }

  @override
  void closeNotifier() {
    profileCubit.close();
    this.dispose();
  }
}
