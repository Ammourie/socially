import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/constants/enums/media_type.dart';
import '../../../../../core/ui/dialogs/story_dialog..dart';
import '../../../../../core/ui/show_toast.dart';
import '../../../../../core/ui/widgets/custom_image.dart';
import '../../../domain/entity/story_entity.dart';
import '../../widget/stories_list_widget.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({Key? key}) : super(key: key);

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        12.verticalSpace,
        _buildTopBar(),
        12.verticalSpace,
        _builldBody(),
      ],
    );
  }

  Widget _builldBody() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildStories(),
          ],
        ),
      ),
    );
  }

  StoriesListWidget _buildStories() {
    final dummyStories = [
      StoryEntity(
        id: 1,
        media: [
          MediaEntity(url: 'https://picsum.photos/200', type: MediaType.image),
          // MediaEntity(
          //     url:
          //         'https://videos.pexels.com/video-files/5512609/5512609-hd_1080_1920_25fps.mp4',
          //     type: MediaType.video),
        ],
        title: 'My Story',
        subtitle: 'Just now',
        userName: 'John Doe',
        userImage: 'https://i.pravatar.cc/150?img=1',
        createdAt: DateTime.now(),
      ),
      StoryEntity(
        id: 2,
        media: [
          MediaEntity(url: 'https://picsum.photos/201', type: MediaType.image),
          MediaEntity(
              url:
                  'https://videos.pexels.com/video-files/5512609/5512609-hd_1080_1920_25fps.mp4',
              type: MediaType.video),
        ],
        title: 'Beach Day',
        subtitle: '2h ago',
        userName: 'Jane Smith',
        userImage: 'https://i.pravatar.cc/150?img=2',
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      StoryEntity(
        id: 3,
        media: [
          MediaEntity(url: 'https://picsum.photos/202', type: MediaType.image),
          MediaEntity(
              url:
                  'https://videos.pexels.com/video-files/5512609/5512609-hd_1080_1920_25fps.mp4',
              type: MediaType.video),
        ],
        title: 'Coffee Time',
        subtitle: '5h ago',
        userName: 'Mike Wilson',
        userImage: 'https://i.pravatar.cc/150?img=3',
        createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      ),
      StoryEntity(
        id: 4,
        media: [
          MediaEntity(url: 'https://picsum.photos/200', type: MediaType.image),
          MediaEntity(
              url:
                  'https://videos.pexels.com/video-files/5512609/5512609-hd_1080_1920_25fps.mp4',
              type: MediaType.video),
        ],
        title: 'My Story',
        subtitle: 'Just now',
        userName: 'John Doe',
        userImage: 'https://i.pravatar.cc/150?img=1',
        createdAt: DateTime.now(),
      ),
      StoryEntity(
        id: 5,
        media: [
          MediaEntity(url: 'https://picsum.photos/201', type: MediaType.image),
          MediaEntity(
              url:
                  'https://videos.pexels.com/video-files/5512609/5512609-hd_1080_1920_25fps.mp4',
              type: MediaType.video),
        ],
        title: 'Beach Day',
        subtitle: '2h ago',
        userName: 'Jane Smith',
        userImage: 'https://i.pravatar.cc/150?img=2',
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      StoryEntity(
        id: 6,
        media: [
          MediaEntity(url: 'https://picsum.photos/202', type: MediaType.image),
          MediaEntity(
              url:
                  'https://videos.pexels.com/video-files/5512609/5512609-hd_1080_1920_25fps.mp4',
              type: MediaType.video),
        ],
        title: 'Coffee Time',
        subtitle: '5h ago',
        userName: 'Mike Wilson',
        userImage: 'https://i.pravatar.cc/150?img=3',
        createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      ),
      StoryEntity(
        id: 7,
        media: [
          MediaEntity(url: 'https://picsum.photos/200', type: MediaType.image),
          MediaEntity(
              url:
                  'https://videos.pexels.com/video-files/5512609/5512609-hd_1080_1920_25fps.mp4',
              type: MediaType.video),
        ],
        title: 'My Story',
        subtitle: 'Just now',
        userName: 'John Doe',
        userImage: 'https://i.pravatar.cc/150?img=1',
        createdAt: DateTime.now(),
      ),
      StoryEntity(
        id: 8,
        media: [
          MediaEntity(url: 'https://picsum.photos/201', type: MediaType.image),
          MediaEntity(
              url:
                  'https://videos.pexels.com/video-files/5512609/5512609-hd_1080_1920_25fps.mp4',
              type: MediaType.video),
        ],
        title: 'Beach Day',
        subtitle: '2h ago',
        userName: 'Jane Smith',
        userImage: 'https://i.pravatar.cc/150?img=2',
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      StoryEntity(
        id: 9,
        media: [
          MediaEntity(url: 'https://picsum.photos/202', type: MediaType.image),
          MediaEntity(
              url:
                  'https://videos.pexels.com/video-files/5512609/5512609-hd_1080_1920_25fps.mp4',
              type: MediaType.video),
        ],
        title: 'Coffee Time',
        subtitle: '5h ago',
        userName: 'Mike Wilson',
        userImage: 'https://i.pravatar.cc/150?img=3',
        createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      ),
    ];

    return StoriesListWidget(
      stories: dummyStories,
      margin: EdgeInsets.only(bottom: 10.h, top: 10.h),
      onStoryTap: (story) {
        showStoryDialog(story: story);
      },
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNotificationIcon(),
          CustomImage.asset(
            AppConstants.IMAGE_SOCIALY,
            height: 65.sp,
          ),
          SizedBox(
            width: 60.sp,
            height: 60.sp,
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
        width: 60.sp,
        height: 60.sp,
      ),
    );
  }
}
