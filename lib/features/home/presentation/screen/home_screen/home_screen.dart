import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../../core/ui/screens/base_screen.dart';
import '../../state_m/cubit/home_cubit.dart';
import '../../state_m/provider/home_screen_notifier.dart';
import 'home_screen_mobile.dart';
import 'home_screen_tablet.dart';

class HomeScreenParam {}

class HomeScreen extends BaseScreen<HomeScreenParam> {
  static const routeName = "/HomeScreen";

  HomeScreen({required HomeScreenParam param, Key? key})
      : super(param: param, key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final sn = HomeScreenNotifier();
  @override
  void initState() {
    super.initState();
    sn.getHomeData();
  }

  @override
  void dispose() {
    sn.closeNotifier();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, _) {
        return ChangeNotifierProvider<HomeScreenNotifier>.value(
          value: sn,
          builder: (context, child) {
            context
                .select<HomeScreenNotifier, bool>((value) => value.isLoading);
            return ModalProgressHUD(
              inAsyncCall: sn.isLoading,
              child: child!,
            );
          },
          child: MultiBlocListener(
            listeners: [
              BlocListener<HomeCubit, HomeState>(
                bloc: sn.postsCubit,
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    postsLoadedState: (posts) {
                      sn.posts = posts;
                    },
                  );
                },
              ),
              BlocListener<HomeCubit, HomeState>(
                bloc: sn.storiesCubit,
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    storiesLoadedState: (stories) {
                      sn.stories = stories;
                    },
                  );
                },
              ),
            ],
            child: ScreenTypeLayout.builder(
              mobile: (_) => const HomeScreenMobile(),
              tablet: (_) => const HomeScreenTablet(),
            ),
          ),
        );
      },
    );
  }
}
