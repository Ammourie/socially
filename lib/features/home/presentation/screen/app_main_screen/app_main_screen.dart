import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../../core/common/app_colors.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/constants/app/app_settings.dart';
import '../../../../../core/firebase/firebase_messaging.dart';
import '../../../../../core/ui/error_ui/error_viewer/error_viewer.dart';
import '../../../../../core/ui/screens/base_screen.dart';
import '../../../../../core/ui/widgets/custom_image.dart';
import '../../../../../core/ui/widgets/custom_scaffold.dart';
import '../../../../../core/ui/widgets/system/double_tap_back_exit_app.dart';
import '../../../../account/presentation/state_m/cubit/account_cubit.dart';
import '../../state_m/provider/app_main_screen_notifier.dart';
import 'app_main_screen_content.dart';

class AppMainScreenParam {}

class AppMainScreen extends BaseScreen<AppMainScreenParam> {
  static const String routeName = "/AppMainScreenScreen";

  const AppMainScreen({
    Key? key,
    required AppMainScreenParam param,
  }) : super(
          key: key,
          param: param,
        );

  @override
  _AppMainScreenState createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  late final AppMainScreenNotifier sn;

  @override
  void initState() {
    super.initState();
    sn = AppMainScreenNotifier(widget.param);
    _initializeNotifications();
  }

  void _initializeNotifications() {
    if (AppSettings.enableNotification &&
        FireBaseMessagingWrapper.notificationLock.isLocked) {
      FireBaseMessagingWrapper.notificationLock.release();
    }
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppMainScreenNotifier>.value(
      value: sn,
      builder: (context, child) {
        _listenToStateChanges(context);
        return _buildMainContent();
      },
    );
  }

  void _listenToStateChanges(BuildContext context) {
    context.select<AppMainScreenNotifier, bool>((p) => p.isLoading);
    context.select<AppMainScreenNotifier, int>((p) => p.selectedIndex);
  }

  Widget _buildMainContent() {
    return DoubleTapBackExitApp(
      child: ModalProgressHUD(
        inAsyncCall: sn.isLoading,
        child: BlocListener<AccountCubit, AccountState>(
          bloc: sn.logoutCubit,
          listener: _handleAccountState,
          child: _buildScaffold(),
        ),
      ),
    );
  }

  void _handleAccountState(BuildContext context, AccountState state) {
    state.maybeWhen(
      accountLoading: () => sn.isLoading = true,
      accountError: (error, callback) {
        sn.isLoading = false;
        ErrorViewer.showError(
            context: context, error: error, callback: callback);
      },
      successLogout: () {
        // sn.isLoading = false;
        // RestartWidget.restartApp(context);
      },
      orElse: () {},
    );
  }

  Widget _buildScaffold() {
    return CustomScaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: ScreenTypeLayout.builder(
        mobile: (_) => _buildMobileLayout(),
        tablet: (_) => _buildDesktopLayout(),
      ),
    );
  }

  Widget? _buildBottomNavigationBar() {
    return ScreenTypeLayout.builder(
      mobile: (_) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.sp),
            topLeft: Radius.circular(30.sp),
          ),
          boxShadow: [
            const BoxShadow(
              color: Colors.black38,
              spreadRadius: 0,
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
          child: NavigationBar(
            height: 150.h,
            indicatorColor: Colors.transparent,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            destinations: _buildNavigationBarDestinations(),
            selectedIndex: sn.selectedIndex,
            onDestinationSelected: sn.onDestinationSelected,
          ),
        ),
      ),
      tablet: (_) => const SizedBox.shrink(),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        NavigationRail(
          useIndicator: true,
          destinations: _buildNavigationDestinations(),
          selectedIndex: sn.selectedIndex,
          onDestinationSelected: sn.onDestinationSelected,
        ),
        const Expanded(child: AppMainScreenContent()),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Container(
      padding: EdgeInsets.all(AppConstants.screenPadding),
      color: Theme.of(context).colorScheme.primary,
      child: const AppMainScreenContent(),
    );
  }

  List<NavigationRailDestination> _buildNavigationDestinations() {
    return const <NavigationRailDestination>[
      NavigationRailDestination(
        icon: Icon(Icons.home_outlined),
        selectedIcon: Icon(Icons.home_filled),
        label: Text('Home'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.explore_outlined),
        selectedIcon: Icon(Icons.explore),
        label: Text('compass'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.person_outline),
        selectedIcon: Icon(Icons.person),
        label: Text('profile'),
      ),
    ];
  }

  List<NavigationDestination> _buildNavigationBarDestinations() {
    double iconSize = 80.sp;
    Color iconColor = AppColors.navBarIconColor;
    return [
      NavigationDestination(
        icon: CustomImage.asset(
          AppConstants.SVG_HOUSE_OUTLINE,
          width: iconSize,
          height: iconSize,
          color: iconColor,
        ),
        selectedIcon: CustomImage.asset(
          AppConstants.SVG_HOUSE_SOLID,
          width: iconSize,
          height: iconSize,
          color: iconColor,
        ),
        label: 'Home',
      ),
      NavigationDestination(
        icon: CustomImage.asset(
          AppConstants.SVG_COMPASS_OUTLINE,
          width: iconSize,
          height: iconSize,
          color: iconColor,
        ),
        selectedIcon: CustomImage.asset(
          AppConstants.SVG_COMPASS_SOLID,
          width: iconSize,
          height: iconSize,
          color: iconColor,
        ),
        label: 'compass',
      ),
      NavigationDestination(
        icon: CustomImage.asset(
          AppConstants.SVG_CIRCLE_USER_OUTLINE,
          width: iconSize,
          height: iconSize,
          color: iconColor,
        ),
        selectedIcon: CustomImage.asset(
          AppConstants.SVG_CIRCLE_USER_SOLID,
          width: iconSize,
          height: iconSize,
          color: iconColor,
        ),
        label: 'profile',
      ),
    ];
  }
}
