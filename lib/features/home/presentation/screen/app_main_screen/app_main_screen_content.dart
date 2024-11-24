import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socially/features/home/presentation/screen/profile_screen/profile_screen.dart';

import '../../state_m/provider/app_main_screen_notifier.dart';
import '../home_screen/home_screen.dart';

class AppMainScreenContent extends StatefulWidget {
  const AppMainScreenContent({Key? key}) : super(key: key);

  @override
  State<AppMainScreenContent> createState() => _AppMainScreenContentState();
}

class _AppMainScreenContentState extends State<AppMainScreenContent> {
  late AppMainScreenNotifier sn;

  @override
  void initState() {
    super.initState();
    sn = context.read<AppMainScreenNotifier>();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<AppMainScreenNotifier>();
    if (sn.selectedIndex == 0) {
      return HomeScreen(param: HomeScreenParam());
    } else if (sn.selectedIndex == 1) {
      return const Scaffold(body: Center(child: Text("Compass")));
    } else {
      return ProfileScreen(param: ProfileScreenParam());
    }
  }
}
