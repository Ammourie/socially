import 'package:flutter/material.dart';
import '../../../../account/presentation/state_m/cubit/account_cubit.dart';

import '../../../../../core/common/custom_modules/screen_notifier.dart';
import '../../screen/app_main_screen/app_main_screen.dart';

class AppMainScreenNotifier extends ScreenNotifier {
  /// Constructors
  AppMainScreenNotifier(this.param);

  /// Fields
  int _selectedIndex = 0;

  late BuildContext context;
  final AppMainScreenParam param;
  final logoutCubit = AccountCubit();
  bool _isLoading = false;

  /// Getters and Setters
  int get selectedIndex => _selectedIndex;
  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// Methods
  void logout() {
    logoutCubit.logout();
  }

  void onDestinationSelected(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  @override
  void closeNotifier() {
    logoutCubit.close();
    this.dispose();
  }
}
