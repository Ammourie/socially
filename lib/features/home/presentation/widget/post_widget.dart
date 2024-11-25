import 'dart:developer';

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
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/constants/enums/media_type.dart';
import '../../../../core/ui/widgets/custom_carousel.dart';
import '../../../../core/ui/widgets/custom_image.dart';
import '../../domain/entity/story_entity.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({
    super.key,
    required this.post,
    this.isTablet = false,
  });

  final PostEntity post;
  final bool isTablet;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  List<MediaEntity> mediaToShow = [];
  bool isPortrait = false;
  @override
  void initState() {
    super.initState();
    mediaToShow = widget.post.mediaList;
  }

  @override
  Widget build(BuildContext context) {
    isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Container(
      padding: EdgeInsets.all(widget.isTablet ? 7.sp : 12.sp),
      decoration: BoxDecoration(
        color: widget.isTablet ? Colors.grey.shade100 : Colors.white,
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
    double avatarRadius = isPortrait
        ? 22.r
        : widget.isTablet
            ? 20.r
            : 50.r;
    double fontSize = widget.isTablet ? 10.sp : 17.sp;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: avatarRadius,
          backgroundImage: CachedNetworkImageProvider(widget.post.userImage),
        ),
        if (!widget.isTablet) 12.horizontalSpace else 4.horizontalSpace,
        Text(
          widget.post.userName,
          style: TextThemeStyles.gloryBold.copyWith(
            fontSize: fontSize,
          ),
        ),
        const Spacer(),
        Text(
          timeago.format(widget.post.createdAt!),
          style: TextThemeStyles.gloryRegular.copyWith(
            color: Colors.grey,
            fontSize: fontSize - 3.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    if (!widget.post.content.isNotEmpty) return const SizedBox.shrink();
    double fontSize = widget.isTablet ? 8.sp : 14.sp;
    return Column(
      children: [
        8.verticalSpace,
        Text(
          widget.post.content,
          style: TextThemeStyles.gloryRegular.copyWith(fontSize: fontSize),
        ),
      ],
    );
  }

  Widget _buildMediaGrid() {
    if (!widget.post.mediaList.isNotEmpty) return const SizedBox.shrink();

    if (mediaToShow.length > 3) {
      return Column(
        children: [
          12.verticalSpace,
          CustomCarousel(
            isTablet: widget.isTablet,
            disableCenter: true,
            aspectRatio: !widget.isTablet ? 1.2 : 2,
            padEnds: true,
            viewportFraction: 1,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            autoPlay: false,
            items: List.generate(
              mediaToShow.length,
              (index) => _buildMediaTileContent(
                mediaToShow[index],
                index,
              ),
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        12.verticalSpace,
        if (mediaToShow.length == 1)
          SizedBox(
            height: !widget.isTablet ? 200.sp : 100.sp,
            width: double.infinity,
            child: _buildMediaTileContent(
              mediaToShow[0],
              0,
            ),
          )
        else
          SizedBox(
            height: !widget.isTablet ? 200.sp : 140.sp,
            child: GridView.custom(
              physics: const NeverScrollableScrollPhysics(),
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
      return _buildMediaWidget(media);
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
        _buildStat(AppConstants.SVG_FAVOURITE,
            text: widget.post.likes.toString()),
        16.horizontalSpace,
        _buildStat(
          AppConstants.SVG_COMMENTS,
          text: widget.post.comments.length.toString(),
        ),
        const Spacer(),
        _buildStat(AppConstants.SVG_BOOKMARK),
      ],
    );
  }

  Widget _buildStat(String svgPath, {String? text}) {
    double fontSize = widget.isTablet ? 7.sp : 14.sp;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomImage.asset(
          svgPath,
          width: widget.isTablet ? 10.sp : 20.sp,
          height: widget.isTablet ? 10.sp : 20.sp,
          color: Colors.grey,
        ),
        if (text != null) ...[
          4.horizontalSpace,
          Text(
            text,
            style: TextThemeStyles.gloryRegular.copyWith(
              fontSize: fontSize,
              color: Colors.grey,
            ),
          )
        ],
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
  final double? borderRadius;

  const VideoPlayerWidget({
    super.key,
    required this.videoUrl,
    this.fit = BoxFit.contain,
    this.borderRadius,
  });

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget>
    with AutomaticKeepAliveClientMixin {
  late CachedVideoPlayerPlusController _controller;
  bool _isInitialized = false;
  bool _isPlaying = false;
  bool _isFinished = false;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  Future<void> _initializeController() async {
    _controller =
        CachedVideoPlayerPlusController.networkUrl(Uri.parse(widget.videoUrl));
    await _controller.initialize();
    _controller.addListener(_videoListener);
    if (mounted) {
      setState(() {
        _isInitialized = true;
      });
    }
  }

  void _videoListener() {
    log((_controller.value.position >= _controller.value.duration).toString());
    if (_controller.value.position >= _controller.value.duration) {
      setState(() {
        _isPlaying = false;
        _isFinished = true;
      });
    }
  }

  void _togglePlay() {
    setState(() {
      _isPlaying = !_isPlaying;
      if (_isPlaying) {
        _controller.play();
      } else {
        _controller.pause();
      }
      if (_isFinished) {
        _isFinished = false;
      }
    });
  }

  void _replay() {
    _controller.seekTo(Duration.zero);
    _controller.play();
    setState(() {
      _isPlaying = true;
      _isFinished = false;
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_videoListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _isInitialized
        ? Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  widget.borderRadius ?? 20.r,
                ),
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: CachedVideoPlayerPlus(_controller),
                ),
              ),
              if (_isFinished)
                IconButton(
                  icon: const Icon(
                    Icons.replay,
                    color: Colors.white,
                    size: 50,
                  ),
                  onPressed: _replay,
                )
              else
                IconButton(
                  icon: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                    size: 50,
                  ),
                  onPressed: _togglePlay,
                ),
            ],
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }

  @override
  bool get wantKeepAlive => true;
}
