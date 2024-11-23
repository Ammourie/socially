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
          MediaEntity(
              url:
                  'https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-4.0.3&q=85&w=2000&h=1200',
              type: MediaType.image),
          MediaEntity(
              url:
                  'https://images.unsplash.com/photo-1433086966358-54859d0ed716?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80',
              type: MediaType.image),
          MediaEntity(
              url:
                  "https://videos.pexels.com/video-files/1409899/1409899-uhd_2560_1440_25fps.mp4",
              type: MediaType.video),
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
          MediaEntity(
              url:
                  'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-4.0.3&q=85&w=2000&h=1200',
              type: MediaType.image),
          MediaEntity(
              url:
                  'https://images.unsplash.com/photo-1495954484750-af469f2f9be5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80',
              type: MediaType.image),
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
          MediaEntity(
              url:
                  'https://images.unsplash.com/photo-1497935586351-b67a49e012bf?ixlib=rb-4.0.3&q=85&w=2000&h=1200',
              type: MediaType.image),
          MediaEntity(
              url:
                  'https://images.unsplash.com/photo-1501854140801-50d01698950b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=775&q=80',
              type: MediaType.image),
          MediaEntity(
              url:
                  "https://videos.pexels.com/video-files/1409899/1409899-uhd_2560_1440_25fps.mp4",
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
          MediaEntity(
              url:
                  'https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?ixlib=rb-4.0.3&q=85&w=2000&h=1200',
              type: MediaType.image),
          MediaEntity(
              url:
                  'https://images.unsplash.com/photo-1418065460487-3e41a6c84dc5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80',
              type: MediaType.image),
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
          MediaEntity(
              url:
                  'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?ixlib=rb-4.0.3&q=85&w=2000&h=1200',
              type: MediaType.image),
          MediaEntity(
              url:
                  'https://images.unsplash.com/photo-1431794062232-2a99a5431c6c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80',
              type: MediaType.image),
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
          MediaEntity(
              url:
                  'https://images.unsplash.com/photo-1426604966848-d7adac402bff?ixlib=rb-4.0.3&q=85&w=2000&h=1200',
              type: MediaType.image),
          MediaEntity(
              url:
                  'https://images.unsplash.com/photo-1470770903676-69b98201ea1c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
              type: MediaType.image),
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
          MediaEntity(
              url:
                  'https://images.unsplash.com/photo-1472214103451-9374bd1c798e?ixlib=rb-4.0.3&q=85&w=2000&h=1200',
              type: MediaType.image),
          MediaEntity(
              url:
                  'https://images.unsplash.com/photo-1470770903676-69b98201ea1c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
              type: MediaType.image),
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
          MediaEntity(
              url:
                  'https://images.unsplash.com/photo-1469474968028-56623f02e42e?ixlib=rb-4.0.3&q=85&w=2000&h=1200',
              type: MediaType.image),
          MediaEntity(
              url:
                  'https://images.unsplash.com/photo-1470770903676-69b98201ea1c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
              type: MediaType.image),
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
          MediaEntity(
              url:
                  'https://images.unsplash.com/photo-1465146344425-f00d5f5c8f07?ixlib=rb-4.0.3&q=85&w=2000&h=1200',
              type: MediaType.image),
          MediaEntity(
              url:
                  'https://images.unsplash.com/photo-1470770903676-69b98201ea1c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
              type: MediaType.image),
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
