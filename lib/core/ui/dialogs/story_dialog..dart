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
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
      value: 0.0,
    );
    _loadMedia();
  }

  @override
  void dispose() {
    _progressController.dispose();
    if (_videoPlayerController?.value.isInitialized ?? false) {
      _videoPlayerController?.dispose();
    }
    super.dispose();
  }

  void _loadMedia() {
    setState(() {
      _isLoading = true;
    });

    final currentMedia = widget.story.media[currentMediaIndex];

    if (currentMedia.type == MediaType.image) {
      _downloadAndShowImage(currentMedia.url);
    } else {
      _initializeVideo(currentMedia.url);
    }
  }

  Future<void> _downloadAndShowImage(String url) async {
    try {
      _imageFile = await DefaultCacheManager().getSingleFile(url);
      setState(() {
        _isLoading = false;
      });
      _startImageTimer();
    } catch (e) {
      showToast('Error downloading image');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _startImageTimer() {
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _progressController.forward().whenComplete(() {
      _nextMedia();
    });
  }

  Future<void> _initializeVideo(String url) async {
    _videoPlayerController =
        CachedVideoPlayerPlusController.networkUrl(Uri.parse(url));
    await _videoPlayerController?.initialize();
    await _videoPlayerController?.setLooping(false);
    _videoPlayerController?.addListener(_onVideoFinished);

    _progressController = AnimationController(
      vsync: this,
      duration:
          _videoPlayerController?.value.duration ?? const Duration(seconds: 5),
    );
    _progressController.forward();

    setState(() {
      _isLoading = false;
    });
    _videoPlayerController?.play();
  }

  void _onVideoFinished() {
    if ((_videoPlayerController?.value.position ?? Duration.zero) >=
        (_videoPlayerController?.value.duration ?? Duration.zero)) {
      _nextMedia();
    }
  }

  void _previousMedia() {
    _progressController.reset();
    if (currentMediaIndex > 0) {
      if (_videoPlayerController?.value.isInitialized ?? false) {
        _videoPlayerController?.dispose();
      }
      setState(() {
        _imageFile = null;
        currentMediaIndex--;
        _loadMedia();
      });
    }
  }

  void _nextMedia() {
    _progressController.reset();
    if (currentMediaIndex < widget.story.media.length - 1) {
      if (_videoPlayerController?.value.isInitialized ?? false) {
        _videoPlayerController?.dispose();
      }
      setState(() {
        _imageFile = null;
        currentMediaIndex++;
        _loadMedia();
      });
    } else {
      Navigator.of(context).pop();
    }
  }

  void _handleTap(TapUpDetails details) {
    final screenWidth = MediaQuery.of(context).size.width;
    final tapPosition = details.globalPosition.dx;

    if (tapPosition < screenWidth / 2) {
      _previousMedia();
    } else {
      _nextMedia();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTapUp: _handleTap,
        onVerticalDragEnd: (details) {
          if (details.primaryVelocity! > 300) {
            Navigator.of(context).pop();
          }
        },
        child: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                _buildCurrentMedia(),
                _buildProgressIndicators(),
                _buildUserInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentMedia() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      );
    }

    final currentMedia = widget.story.media[currentMediaIndex];

    if (currentMedia.type == MediaType.image) {
      return Container(
        width: 1.sw,
        height: 1.sh,
        color: Theme.of(context).primaryColor,
        child: _imageFile != null
            ? Image.file(
                _imageFile!,
                fit: BoxFit.contain,
              )
            : CachedNetworkImage(
                imageUrl: currentMedia.url,
                fit: BoxFit.contain,
              ),
      );
    } else {
      return Container(
        color: Theme.of(context).primaryColor,
        width: 1.sw,
        height: 1.sh,
        child: (_videoPlayerController?.value.isInitialized ?? false)
            ? Center(
                child: AspectRatio(
                  aspectRatio: _videoPlayerController!.value.aspectRatio,
                  child: CachedVideoPlayerPlus(
                    _videoPlayerController!,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      );
    }
  }

  Widget _buildProgressIndicators() {
    return Positioned(
      top: 10,
      left: 10,
      right: 10,
      child: Row(
        children: widget.story.media.asMap().entries.map((entry) {
          return Expanded(
            child: Container(
              height: 2,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              child: entry.key == currentMediaIndex
                  ? AnimatedBuilder(
                      animation: _progressController,
                      builder: (context, child) {
                        return LinearProgressIndicator(
                          value: _progressController.value,
                          backgroundColor: Colors.white.withOpacity(0.5),
                          valueColor:
                              const AlwaysStoppedAnimation<Color>(Colors.white),
                        );
                      },
                    )
                  : Container(
                      color: entry.key < currentMediaIndex
                          ? Colors.white
                          : Colors.white.withOpacity(0.5),
                    ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Positioned(
      top: 20,
      left: 10,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(widget.story.userImage),
            radius: 20,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.story.userName,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.story.subtitle,
                style: const TextStyle(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
