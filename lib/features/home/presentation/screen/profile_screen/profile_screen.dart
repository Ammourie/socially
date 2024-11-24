import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:socially/core/ui/screens/base_screen.dart';

import '../../state_m/cubit/profile_cubit.dart';
import '../../state_m/provider/profile_screen_notifier.dart';
import 'profile_screen_content.dart';

class ProfileScreenParam {}

class ProfileScreen extends BaseScreen<ProfileScreenParam> {
  const ProfileScreen({super.key, required super.param});
  static const routeName = "/ProfileScreen";
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileScreenNotifier sn;
  @override
  void initState() {
    super.initState();
    sn = ProfileScreenNotifier();
    sn.getProfile();
  }

  @override
  void dispose() {
    super.dispose();
    sn.closeNotifier();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sn,
      child: BlocListener<ProfileCubit, ProfileState>(
        bloc: sn.profileCubit,
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            profileLoadedState: (profileEntity) {
              sn.profileEntity = profileEntity;
            },
          );
        },
        child: const Scaffold(
          body: ProfileScreenContent(),
        ),
      ),
    );
  }
}
