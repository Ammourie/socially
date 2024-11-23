import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:socially/core/common/app_config.dart';
import 'package:socially/core/theme/text_theme_styles.dart';
import 'package:socially/features/home/domain/entity/post_entity.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_video_player_plus/cached_video_player_plus.dart';

import '../../../../core/common/app_colors.dart';
import '../../../../core/constants/enums/media_type.dart';
import '../../domain/entity/story_entity.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({
    super.key,
    required this.post,
  });

  final PostEntity post;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  List<MediaEntity> mediaToShow = [];
  @override
  void initState() {
    super.initState();
    mediaToShow = widget.post.mediaList.take(3).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          _buildContent(),
          _buildMediaGrid(),
          12.verticalSpace,
          Divider(color: AppColors.primaryColorLight.withOpacity(0.6)),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 22.r,
          backgroundImage: CachedNetworkImageProvider(widget.post.userImage),
        ),
        12.horizontalSpace,
        Text(
          widget.post.userName,
          style: TextThemeStyles.gloryBold.copyWith(
            fontSize: 17.sp,
          ),
        ),
        const Spacer(),
        Text(
          timeago.format(widget.post.createdAt!),
          style: TextThemeStyles.gloryRegular.copyWith(
            color: Colors.grey,
            fontSize: 13.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    if (!widget.post.content.isNotEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        8.verticalSpace,
        Text(
          widget.post.content,
          style: TextThemeStyles.gloryRegular.copyWith(fontSize: 14.sp),
        ),
      ],
    );
  }

  Widget _buildMediaGrid() {
    if (!widget.post.mediaList.isNotEmpty) return const SizedBox.shrink();

    // Take only first 3 media items

    return Column(
      children: [
        12.verticalSpace,
        if (mediaToShow.length == 1)
          SizedBox(
            height: 200.sp,
            width: double.infinity,
            child: _buildMediaTileContent(
              mediaToShow[0],
              0,
            ),
          )
        else
          SizedBox(
            height: 200.sp,
            child: GridView.custom(
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 3,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: [
                  QuiltedGridTile(2, 2),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                (context, index) => _buildMediaTileContent(
                  mediaToShow[index],
                  index,
                ),
                childCount: mediaToShow.length,
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
    final borderRadius = BorderRadius.circular(20.r);
    if (media.type == MediaType.video) {
      return ClipRRect(
        borderRadius: borderRadius,
        child: _buildMediaWidget(media),
      );
    }
    return GestureDetector(
      onTap: () => _showImageViewer(mediaToShow, index),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: _buildMediaWidget(media),
      ),
    );
  }

  Widget _buildFooter() {
    return Row(
      children: [
        _buildStat(Icons.favorite_border, widget.post.likes.toString()),
        16.horizontalSpace,
        _buildStat(
          Icons.chat_bubble_outline,
          widget.post.comments.length.toString(),
        ),
        Spacer(),
        _buildStat(Icons.bookmark_border, "Save"),
      ],
    );
  }

  Widget _buildStat(IconData icon, String count) {
    return Row(
      children: [
        Icon(icon, size: 20.sp, color: Colors.grey),
        4.horizontalSpace,
        Text(
          count,
          style: TextThemeStyles.gloryRegular.copyWith(
            fontSize: 14.sp,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildMediaWidget(MediaEntity media) {
    if (media.type == MediaType.video) {
      return VideoPlayerWidget(
        videoUrl: media.url,
        fit: BoxFit.cover,
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

  void _showImageViewer(List<MediaEntity> mediaList, int initialIndex) {
    final reorderedList = [
      mediaList[initialIndex],
      ...mediaList.sublist(0, initialIndex),
      ...mediaList.sublist(initialIndex + 1),
    ];

    showDialog(
      context: AppConfig().appContext!,
      builder: (context) => _buildImageViewerDialog(context, reorderedList),
    );
  }

  Widget _buildImageViewerDialog(
      BuildContext context, List<MediaEntity> mediaList) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: Stack(
        children: [
          _buildPhotoViewGallery(mediaList),
          _buildCloseButton(context),
        ],
      ),
    );
  }

  Widget _buildPhotoViewGallery(List<MediaEntity> mediaList) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (context, index) =>
            _buildPhotoViewGalleryItem(mediaList[index]),
        itemCount: mediaList.length,
        loadingBuilder: _buildLoadingIndicator,
        backgroundDecoration: const BoxDecoration(color: Colors.black),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildPhotoViewGalleryItem(MediaEntity media) {
    return PhotoViewGalleryPageOptions(
      imageProvider: CachedNetworkImageProvider(media.url),
      initialScale: PhotoViewComputedScale.contained * 0.8,
      heroAttributes: PhotoViewHeroAttributes(tag: media.url),
    );
  }

  Widget _buildLoadingIndicator(context, event) {
    return Center(
      child: Container(
        width: 20.0,
        height: 20.0,
        child: CircularProgressIndicator(
          value: event == null
              ? 0
              : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
        ),
      ),
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return Positioned(
      top: 10.sp,
      right: 10.sp,
      child: IconButton(
        icon: Icon(Icons.close, color: Colors.white, size: 30.sp),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final BoxFit fit;

  const VideoPlayerWidget({
    super.key,
    required this.videoUrl,
    this.fit = BoxFit.contain,
  });

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late CachedVideoPlayerPlusController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  Future<void> _initializeController() async {
    _controller =
        CachedVideoPlayerPlusController.networkUrl(Uri.parse(widget.videoUrl));
    await _controller.initialize();
    if (mounted) {
      setState(() {
        _isInitialized = true;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: CachedVideoPlayerPlus(_controller),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
