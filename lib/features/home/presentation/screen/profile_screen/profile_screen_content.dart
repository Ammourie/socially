import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:socially/core/theme/text_theme_styles.dart';
import 'package:socially/core/ui/error_ui/errors_screens/error_widget.dart';
import 'package:socially/features/home/presentation/state_m/provider/app_main_screen_notifier.dart';

import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/constants/enums/media_type.dart';
import '../../../../../core/ui/dialogs/gallery_dialog.dart';
import '../../../../../core/ui/show_toast.dart';
import '../../../../../core/ui/widgets/custom_image.dart';
import '../../../../../core/ui/widgets/waiting_widget.dart';
import '../../../domain/entity/story_entity.dart';
import '../../state_m/cubit/profile_cubit.dart';
import '../../state_m/provider/profile_screen_notifier.dart';
import '../../widget/post_widget.dart';

class ProfileScreenContent extends StatefulWidget {
  const ProfileScreenContent({super.key});

  @override
  State<ProfileScreenContent> createState() => _ProfileScreenContentState();
}

class _ProfileScreenContentState extends State<ProfileScreenContent> {
  late ProfileScreenNotifier sn;

  @override
  void initState() {
    sn = context.read<ProfileScreenNotifier>();
    super.initState();
  }

  bool isPortrait = false;
  @override
  Widget build(BuildContext context) {
    isPortrait = MediaQuery.of(context).orientation == Orientation.portrait ||
        sn.isTablet;
    return SafeArea(
      child: BlocBuilder<ProfileCubit, ProfileState>(
        bloc: sn.profileCubit,
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const ScreenNotImplementedErrorWidget(),
            profileLoadingState: () => const WaitingWidget(),
            profileInitState: () => const WaitingWidget(),
            profileErrorState: (error, callback) => ErrorScreenWidget(
              error: error,
              callback: callback,
            ),
            profileLoadedState: (_) => _buildProfile(),
          );
        },
      ),
    );
  }

  Widget _buildProfile() {
    return Column(
      children: [
        12.verticalSpace,
        _buildTopBar(),
        12.verticalSpace,
        if (isPortrait) ...[
          _buildProfileImage(),
          _buildUserName(),
          8.verticalSpace,
          _exploreButton(),
          8.verticalSpace,
        ],
        Expanded(
          child: GridView.custom(
            padding: EdgeInsets.symmetric(
              horizontal: !sn.isTablet ? 10.sp : 4.sp,
              vertical: !sn.isTablet ? 10.sp : 4.sp,
            ),
            shrinkWrap: true,
            gridDelegate: SliverQuiltedGridDelegate(
              crossAxisCount: 3,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              repeatPattern: QuiltedGridRepeatPattern.inverted,
              pattern: [
                const QuiltedGridTile(2, 2),
                const QuiltedGridTile(1, 1),
                const QuiltedGridTile(1, 1),
              ],
            ),
            childrenDelegate: SliverChildBuilderDelegate(
              (context, index) => _buildMediaTileContent(
                sn.profileEntity.stories[index],
                index,
              ),
              childCount: sn.profileEntity.stories.length,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildMediaTileContent(
    MediaEntity media,
    int index,
  ) {
    final borderRadius = BorderRadius.circular(10.r);
    if (media.type == MediaType.video) {
      return _buildMediaWidget(media);
    }
    return GestureDetector(
      onTap: () => showGalleryDialog(sn.profileEntity.stories, index),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: _buildMediaWidget(media),
      ),
    );
  }

  Widget _buildMediaWidget(MediaEntity media) {
    if (media.type == MediaType.video) {
      return VideoPlayerWidget(
        videoUrl: media.url,
        fit: BoxFit.cover,
        borderRadius: 10.r,
      );
    } else {
      return CachedNetworkImage(
        imageUrl: media.url,
        fit: BoxFit.cover,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );
    }
  }

  Widget _exploreButton() {
    double iconSize = sn.isTablet
        ? 7.sp
        : isPortrait
            ? 25.sp
            : 15.sp;
    double fontSize = sn.isTablet
        ? 7.sp
        : isPortrait
            ? 18.sp
            : 12.sp;
    return GestureDetector(
      onTap: () {
        context.read<AppMainScreenNotifier>().selectedIndex = 0;
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.arrow_back,
            size: iconSize,
          ),
          2.horizontalSpace,
          Text(
            "Explore",
            style: TextThemeStyles.robotoRegular.copyWith(
              fontSize: fontSize,
            ),
          )
        ],
      ),
    );
  }

  Text _buildUserName() {
    double fontSize = sn.isTablet
        ? 8.sp
        : isPortrait
            ? 30.sp
            : 15.sp;
    return Text(
      sn.profileEntity.userName,
      style: TextThemeStyles.robotoBold.copyWith(
        fontSize: fontSize,
      ),
    );
  }

  CircleAvatar _buildProfileImage() {
    double radius = sn.isTablet
        ? 25.sp
        : isPortrait
            ? 90.sp
            : 10.sp;
    return CircleAvatar(
      radius: radius,
      backgroundImage: CachedNetworkImageProvider(
        sn.profileEntity.profileImage,
      ),
    );
  }

  Widget _buildTopBar() {
    double logoSize = sn.isTablet
        ? isPortrait
            ? 7.sp
            : 10.sp
        : isPortrait
            ? 20.sp
            : 10.sp;
    double iconSize = sn.isTablet
        ? 7.sp
        : isPortrait
            ? 20.sp
            : 10.sp;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isPortrait
              ? SizedBox(
                  width: iconSize,
                  height: iconSize,
                )
              : _buildProfileImage(),
          CustomImage.asset(
            AppConstants.IMAGE_SOCIALY,
            height: logoSize,
          ),
          _buildNotificationIcon(iconSize),
        ],
      ),
    );
  }

  Widget _buildNotificationIcon(double iconSize) {
    return InkWell(
      onTap: () {
        showToast('Notifications');
      },
      child: CustomImage.asset(
        AppConstants.SVG_BELL,
        width: iconSize,
        height: iconSize,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
