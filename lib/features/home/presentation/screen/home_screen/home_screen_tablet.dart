import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:socially/core/theme/text_theme_styles.dart';
import 'package:socially/features/home/presentation/screen/home_screen/home_screen_mobile.dart';
import 'package:socially/features/home/presentation/widget/stories_list_widget.dart';

import '../../../../../core/ui/dialogs/story_dialog.dart';
import '../../state_m/provider/home_screen_notifier.dart';
import '../../widget/post_widget.dart';
import '../profile_screen/profile_screen.dart';

class HomeScreenTablet extends StatefulWidget {
  const HomeScreenTablet({Key? key}) : super(key: key);

  @override
  State<HomeScreenTablet> createState() => _HomeScreenTabletState();
}

class _HomeScreenTabletState extends State<HomeScreenTablet> {
  late HomeScreenNotifier sn;
  @override
  void initState() {
    super.initState();
    sn = context.read<HomeScreenNotifier>();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<HomeScreenNotifier>();

    return OrientationBuilder(builder: (context, orientation) {
      return orientation == Orientation.portrait
          ? Padding(
              padding: EdgeInsets.all(12.sp),
              child: const HomeScreenMobile(),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 12.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildMainContent(),
                  4.horizontalSpace,
                  _buildProfileSidebar(context),
                ],
              ),
            );
    });
  }

  Widget _buildMainContent() {
    return Expanded(
      child: Column(
        children: [
          12.verticalSpace,
          _buildStories(),
          12.verticalSpace,
          _buildPosts(),
        ],
      ),
    );
  }

  Widget _buildStories() {
    return StoriesListWidget(
      stories: sn.stories,
      height: 0.1.sh,
      spacingWidget: 5.horizontalSpace,
      margin: EdgeInsets.zero,
      onStoryTap: (story) {
        showStoryDialog(story: story, isTablet: true);
      },
    );
  }

  Widget _buildPosts() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            12.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 0.2.sw,
                  margin: EdgeInsets.symmetric(horizontal: 6.sp),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        size: 6.sp,
                      ),
                      4.horizontalSpace,
                      Text(
                        'Search...',
                        style: TextThemeStyles.robotoBold.copyWith(
                          fontSize: 6.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            10.verticalSpace,
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: sn.posts.length,
                padding: EdgeInsets.all(8.sp),
                separatorBuilder: (context, index) => 12.verticalSpace,
                itemBuilder: (context, index) {
                  return PostWidget(
                    post: sn.posts[index],
                    isTablet: true,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSidebar(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: Theme.of(context).colorScheme.surface,
      ),
      width: 0.27.sw,
      child: ProfileScreen(
        param: ProfileScreenParam(isTablet: true),
      ),
    );
  }
}
