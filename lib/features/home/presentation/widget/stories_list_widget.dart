import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../domain/entity/story_entity.dart';

class StoriesListWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? fontSize;
  final FontWeight? fontWeight;
  final List<StoryEntity> stories;
  final Color? backgroundColor;
  final void Function(StoryEntity story)? onStoryTap;
  final Widget? spacingWidget;

  const StoriesListWidget({
    super.key,
    required this.stories,
    this.height,
    this.width,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.padding,
    this.margin,
    this.fontSize,
    this.fontWeight,
    this.backgroundColor,
    this.onStoryTap,
    this.spacingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 1.sw,
      height: height ?? 75.sp,
      clipBehavior: Clip.hardEdge,
      decoration: _buildDecoration(context),
      padding: padding,
      margin: margin ?? EdgeInsets.symmetric(horizontal: 10.w),
      child: _buildStoriesList(),
    );
  }

  BoxDecoration _buildDecoration(BuildContext context) {
    return BoxDecoration(
      color: backgroundColor ?? Colors.white.withOpacity(0.1),
      borderRadius: BorderRadius.circular(borderRadius ?? 10000.r),
      border: Border.all(
        color: borderColor ?? Colors.transparent,
        width: borderWidth ?? 1,
      ),
    );
  }

  Widget _buildStoriesList() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: stories.length,
      itemBuilder: _buildStoryItem,
      separatorBuilder: (context, index) => spacingWidget ?? 12.horizontalSpace,
    );
  }

  Widget _buildStoryItem(BuildContext context, int index) {
    final story = stories[index];
    return GestureDetector(
      onTap: () => onStoryTap?.call(story),
      child: Container(
        width: 3 * (height ?? 75.sp) / 4,
        height: 3 * (height ?? 75.sp) / 4,
        margin: EdgeInsetsDirectional.only(
          start: index == 0 ? 10.sp : 0,
          end: index == stories.length - 1 ? 10.sp : 0,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(story.userImage),
        ),
      ),
    );
  }
}
