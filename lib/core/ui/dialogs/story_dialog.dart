import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socially/core/common/app_config.dart';
import 'package:socially/core/constants/enums/media_type.dart';
import 'package:socially/core/ui/show_toast.dart';
import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import '../../../features/home/domain/entity/story_entity.dart';
import '../../theme/text_theme_styles.dart';

Future<void> showStoryDialog({
  required StoryEntity story,
}) {
  return showGeneralDialog(
    context: AppConfig().appContext!,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(AppConfig().appContext!)
        .modalBarrierDismissLabel,
    barrierColor: Colors.black87,
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation1, animation2) {
      return StoryDialog(story: story);
    },
    transitionBuilder: (context, animation1, animation2, child) {
      return SlideTransition(
        position: Tween(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ).animate(animation1),
        child: child,
      );
    },
  );
}

class StoryDialog extends StatefulWidget {
  final StoryEntity story;

  const StoryDialog({
    Key? key,
    required this.story,
  }) : super(key: key);

  @override
  State<StoryDialog> createState() => _StoryDialogState();
}

class _StoryDialogState extends State<StoryDialog>
    with TickerProviderStateMixin {
  int currentMediaIndex = 0;
  CachedVideoPlayerPlusController? _videoPlayerController;
  late AnimationController _progressController;
  bool _isLoading = true;
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _initProgressController();
    _loadMedia();
  }

  void _initProgressController() {
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
      value: 0.0,
    );
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  void _disposeControllers() {
    _progressController.dispose();
    if (_videoPlayerController?.value.isInitialized ?? false) {
      _videoPlayerController?.dispose();
    }
  }

  void _loadMedia() {
    setState(() => _isLoading = true);
    final currentMedia = widget.story.media[currentMediaIndex];
    currentMedia.type == MediaType.image
        ? _downloadAndShowImage(currentMedia.url)
        : _initializeVideo(currentMedia.url);
  }

  Future<void> _downloadAndShowImage(String url) async {
    try {
      _imageFile = await DefaultCacheManager().getSingleFile(url);
      setState(() => _isLoading = false);
      _startImageTimer();
    } catch (e) {
      showToast('Error downloading image');
      setState(() => _isLoading = false);
    }
  }

  void _startImageTimer() {
    _resetProgressController(const Duration(seconds: 5));
    _progressController.forward().whenComplete(_nextMedia);
  }

  void _resetProgressController(Duration duration) {
    _progressController = AnimationController(
      vsync: this,
      duration: duration,
    );
  }

  Future<void> _initializeVideo(String url) async {
    await _setupVideoController(url);
    _resetProgressController(
      _videoPlayerController?.value.duration ?? const Duration(seconds: 5),
    );
    _progressController.forward();
    setState(() => _isLoading = false);
    _videoPlayerController?.play();
  }

  Future<void> _setupVideoController(String url) async {
    _videoPlayerController =
        CachedVideoPlayerPlusController.networkUrl(Uri.parse(url));
    await _videoPlayerController?.initialize();
    await _videoPlayerController?.setLooping(false);
    _videoPlayerController?.addListener(_onVideoFinished);
  }

  void _onVideoFinished() {
    if (_isVideoComplete()) {
      _nextMedia();
    }
  }

  bool _isVideoComplete() {
    return (_videoPlayerController?.value.position ?? Duration.zero) >=
        (_videoPlayerController?.value.duration ?? Duration.zero);
  }

  void _previousMedia() {
    if (currentMediaIndex > 0) {
      _changeMedia(currentMediaIndex - 1);
    }
  }

  void _nextMedia() {
    if (currentMediaIndex < widget.story.media.length - 1) {
      _changeMedia(currentMediaIndex + 1);
    } else {
      Navigator.of(context).pop();
    }
  }

  void _changeMedia(int newIndex) {
    _progressController.reset();
    _cleanupCurrentMedia();
    setState(() {
      currentMediaIndex = newIndex;
      _loadMedia();
    });
  }

  void _cleanupCurrentMedia() {
    if (_videoPlayerController?.value.isInitialized ?? false) {
      _videoPlayerController?.dispose();
    }
    _imageFile = null;
  }

  void _handleTap(TapUpDetails details) {
    final screenWidth = MediaQuery.of(context).size.width;
    final tapPosition = details.globalPosition.dx;
    tapPosition < screenWidth / 2 ? _previousMedia() : _nextMedia();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: GestureDetector(
        onTapUp: _handleTap,
        onVerticalDragEnd: _handleVerticalDrag,
        child: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                _buildCurrentMedia(),
                _buildMask(),
                _buildProgressIndicators(),
                _buildUserInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleVerticalDrag(DragEndDetails details) {
    if (details.primaryVelocity! > 300) {
      Navigator.of(context).pop();
    }
  }

  Widget _buildMask() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        width: 1.sw,
        height: 0.2.sh,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0.4),
              Colors.transparent,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentMedia() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.white),
      );
    }

    final currentMedia = widget.story.media[currentMediaIndex];
    return currentMedia.type == MediaType.image
        ? _buildImageMedia(currentMedia.url)
        : _buildVideoMedia();
  }

  Widget _buildImageMedia(String url) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      child: _imageFile != null
          ? Image.file(_imageFile!, fit: BoxFit.contain)
          : CachedNetworkImage(imageUrl: url, fit: BoxFit.contain),
    );
  }

  Widget _buildVideoMedia() {
    return Container(
      color: Theme.of(context).primaryColor,
      width: 1.sw,
      height: 1.sh,
      child: (_videoPlayerController?.value.isInitialized ?? false)
          ? Center(
              child: AspectRatio(
                aspectRatio: _videoPlayerController!.value.aspectRatio,
                child: CachedVideoPlayerPlus(_videoPlayerController!),
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  Widget _buildProgressIndicators() {
    return Positioned(
      top: 10,
      left: 10,
      right: 10,
      child: Row(
        children: widget.story.media
            .asMap()
            .entries
            .map(_buildProgressIndicator)
            .toList(),
      ),
    );
  }

  Widget _buildProgressIndicator(MapEntry<int, dynamic> entry) {
    return Expanded(
      child: Container(
        height: 2,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        child: entry.key == currentMediaIndex
            ? _buildActiveProgressIndicator()
            : _buildInactiveProgressIndicator(entry.key),
      ),
    );
  }

  Widget _buildActiveProgressIndicator() {
    return AnimatedBuilder(
      animation: _progressController,
      builder: (context, child) {
        return LinearProgressIndicator(
          value: _progressController.value,
          backgroundColor: Colors.white.withOpacity(0.5),
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
        );
      },
    );
  }

  Widget _buildInactiveProgressIndicator(int index) {
    return Container(
      color: index < currentMediaIndex
          ? Colors.white
          : Colors.white.withOpacity(0.5),
    );
  }

  Widget _buildUserInfo() {
    return PositionedDirectional(
      top: 20.sp,
      start: 20.sp,
      child: Row(
        children: [
          _buildBackButton(),
          12.horizontalSpace,
          _buildUserName(),
          12.horizontalSpace,
          _buildSubtitle(),
        ],
      ),
    );
  }

  Widget _buildBackButton() {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        padding: EdgeInsets.all(10.sp),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Icon(
          Icons.arrow_back,
          size: 20.sp,
          color: const Color.fromARGB(255, 58, 3, 153),
        ),
      ),
    );
  }

  Widget _buildUserName() {
    return Text(
      widget.story.userName,
      style: TextThemeStyles.robotoBold.copyWith(color: Colors.white),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      widget.story.subtitle,
      style: TextThemeStyles.robotoRegular.copyWith(
        color: Colors.white70,
        fontSize: 11.sp,
      ),
    );
  }
}
