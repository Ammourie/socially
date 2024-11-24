import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:socially/core/ui/error_ui/errors_screens/error_widget.dart';
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
  var _vSpace = 12.verticalSpace;
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        _vSpace = orientation == Orientation.portrait
            ? 12.verticalSpace
            : 6.verticalSpace;
        return _buildScreen(orientation == Orientation.portrait);
      },
    );
  }

  Column _buildScreen(bool isPortrait) {
    return Column(
      children: [
        _vSpace,
        _buildTopBar(isPortrait),
        _vSpace,
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
            _vSpace,
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
          homeLoadingState: _buildPostsLoading,
          homeInitState: _buildPostsLoading,
          homeErrorState: _buildErrorWidget,
          postsLoadedState: (posts) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.sp),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: posts.length,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) =>
                  isPortrait ? 18.verticalSpace : 24.verticalSpace,
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
            homeLoadingState: _buildStoriesLoading,
            homeInitState: _buildStoriesLoading,
            homeErrorState: _buildErrorWidget,
            storiesLoadedState: (stories) =>
                _buildStoriesList(stories, isPortrait));
      },
    );
  }

  Widget _buildNotImplementedError() => const ScreenNotImplementedErrorWidget();

  Widget _buildStoriesLoading() => SizedBox(
        height: 75.sp,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            separatorBuilder: (context, index) => 10.horizontalSpace,
            itemBuilder: (context, index) => CircleAvatar(
              radius: 30.sp,
              backgroundColor: Colors.white,
            ),
          ),
        ),
      );

  Widget _buildPostsLoading() => Container(
        height: 1000.sp,
        padding: EdgeInsets.symmetric(horizontal: 4.sp),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 5,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => 18.verticalSpace,
            itemBuilder: (context, index) => Container(
              height: 300.sp,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ),
        ),
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
          _buildNotificationIcon(isPortrait),
          CustomImage.asset(
            AppConstants.IMAGE_SOCIALY,
            height: isPortrait ? 20.sp : 10.sp,
          ),
          SizedBox(
            width: isPortrait ? 25.sp : 15.sp,
            height: isPortrait ? 25.sp : 15.sp,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationIcon(bool isPortrait) {
    return InkWell(
      onTap: () {
        showToast('Notifications');
      },
      child: CustomImage.asset(
        AppConstants.SVG_BELL,
        width: isPortrait ? 25.sp : 15.sp,
        height: isPortrait ? 25.sp : 15.sp,
      ),
    );
  }
}
