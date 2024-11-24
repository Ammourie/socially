import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:socially/core/common/app_config.dart';
import 'package:socially/features/home/domain/entity/story_entity.dart';

import '../../constants/enums/media_type.dart';

void showGalleryDialog(List<MediaEntity> mediaList, int initialIndex) {
  final reorderedList = [
    mediaList[initialIndex],
    ...mediaList.sublist(0, initialIndex),
    ...mediaList.sublist(initialIndex + 1),
  ];
  final filteredList =
      reorderedList.where((media) => media.type == MediaType.image).toList();
  if (filteredList.isEmpty) return;

  showDialog(
    context: AppConfig().appContext!,
    builder: (context) => _ImageViewerDialog(mediaList: reorderedList),
  );
}

class _ImageViewerDialog extends StatelessWidget {
  final List<MediaEntity> mediaList;

  const _ImageViewerDialog({
    required this.mediaList,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: Stack(
        children: [
          _PhotoViewGallery(mediaList: mediaList),
          _CloseButton(),
        ],
      ),
    );
  }
}

class _PhotoViewGallery extends StatelessWidget {
  final List<MediaEntity> mediaList;

  const _PhotoViewGallery({
    required this.mediaList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (context, index) =>
            _buildPhotoViewGalleryItem(mediaList[index]),
        itemCount: mediaList.length,
        loadingBuilder: (context, event) => _LoadingIndicator(event: event),
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
}

class _LoadingIndicator extends StatelessWidget {
  final ImageChunkEvent? event;

  const _LoadingIndicator({
    this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 20.0,
        height: 20.0,
        child: CircularProgressIndicator(
          value: event == null
              ? 0
              : event!.cumulativeBytesLoaded / event!.expectedTotalBytes!,
        ),
      ),
    );
  }
}

class _CloseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
