import 'dart:async';

import 'package:flutter/material.dart';
import 'package:socially/core/common/app_config.dart';
import 'package:socially/core/constants/enums/media_type.dart';
import 'package:video_player/video_player.dart';
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
  VideoPlayerController? _videoPlayerController;
  bool _isPlaying = false;
  late AnimationController _progressController;

  @override
  void initState() {
    super.initState();

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
    final currentMedia = widget.story.media[currentMediaIndex];

    if (currentMedia.type == MediaType.image) {
      _startImageTimer();
    } else {
      _initializeVideo(currentMedia.url);
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
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));
    await _videoPlayerController?.initialize();
    await _videoPlayerController?.setLooping(false);
    _videoPlayerController?.addListener(_onVideoFinished);

    _progressController.reset();
    _progressController.duration = _videoPlayerController?.value.duration;
    _progressController.forward();

    setState(() {
      _isPlaying = true;
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
    final currentMedia = widget.story.media[currentMediaIndex];

    if (currentMedia.type == MediaType.image) {
      return Image.network(
        currentMedia.url,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    } else {
      return (_videoPlayerController?.value.isInitialized ?? false)
          ? AspectRatio(
              aspectRatio: _videoPlayerController!.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController!),
            )
          : const Center(child: CircularProgressIndicator());
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
            backgroundImage: NetworkImage(widget.story.userImage),
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
