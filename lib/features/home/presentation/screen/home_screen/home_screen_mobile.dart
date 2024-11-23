import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socially/core/ui/error_ui/errors_screens/error_widget.dart';
import 'package:socially/core/ui/widgets/waiting_widget.dart';
import 'package:socially/features/home/presentation/widget/post_widget.dart';

import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/errors/app_errors.dart';
import '../../../../../core/ui/dialogs/story_dialog.dart';
import '../../../../../core/ui/show_toast.dart';
import '../../../../../core/ui/widgets/custom_image.dart';
import '../../../domain/entity/story_entity.dart';
import '../../state_m/cubit/home_cubit.dart';
import '../../state_m/provider/home_screen_notifier.dart';
import '../../widget/stories_list_widget.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({Key? key}) : super(key: key);

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return _buildScreen(orientation == Orientation.portrait);
      },
    );
  }

  Column _buildScreen(bool isPortrait) {
    return Column(
      children: [
        12.verticalSpace,
        _buildTopBar(isPortrait),
        12.verticalSpace,
        _builldBody(isPortrait),
      ],
    );
  }

  Widget _builldBody(bool isPortrait) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildStories(isPortrait),
            12.verticalSpace,
            _buildPosts(isPortrait),
          ],
        ),
      ),
    );
  }

  Widget _buildPosts(bool isPortrait) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: context.read<HomeScreenNotifier>().postsCubit,
      builder: (context, state) {
        return state.maybeWhen(
          orElse: _buildNotImplementedError,
          homeLoadingState: _buildLoadingWidget,
          homeInitState: _buildLoadingWidget,
          homeErrorState: _buildErrorWidget,
          postsLoadedState: (posts) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.sp),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: posts.length,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => 18.verticalSpace,
              itemBuilder: (context, index) {
                return PostWidget(post: posts[index]);
              },
            ),
          ), // Dummy implementation
        );
      },
    );
  }

  Widget _buildStories(bool isPortrait) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: context.read<HomeScreenNotifier>().storiesCubit,
      builder: (context, state) {
        return state.maybeWhen(
            orElse: _buildNotImplementedError,
            homeLoadingState: _buildLoadingWidget,
            homeInitState: _buildLoadingWidget,
            homeErrorState: _buildErrorWidget,
            storiesLoadedState: (stories) =>
                _buildStoriesList(stories, isPortrait));
      },
    );
  }

  Widget _buildNotImplementedError() => const ScreenNotImplementedErrorWidget();

  Widget _buildLoadingWidget() => const WaitingWidget(
        option: ProgressIndicatorOption.Linear,
      );

  Widget _buildErrorWidget(AppErrors error, void Function() callback) =>
      ErrorScreenWidget(error: error, callback: callback);

  Widget _buildStoriesList(List<StoryEntity> stories, bool isPortrait) =>
      StoriesListWidget(
        stories: stories,
        margin: EdgeInsets.only(bottom: 10.sp, top: 10.sp),
        height: isPortrait ? 75.sp : 40.sp,
        onStoryTap: (story) {
          showStoryDialog(story: story);
        },
      );

  Widget _buildTopBar(bool isPortrait) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNotificationIcon(),
          CustomImage.asset(
            AppConstants.IMAGE_SOCIALY,
            height: 20.sp,
          ),
          SizedBox(
            width: 25.sp,
            height: 25.sp,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationIcon() {
    return InkWell(
      onTap: () {
        showToast('Notifications');
      },
      child: CustomImage.asset(
        AppConstants.SVG_BELL,
        width: 25.sp,
        height: 25.sp,
      ),
    );
  }
}
