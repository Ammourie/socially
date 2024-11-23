import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 1.sw,
      height: height ?? 220.sp,
      clipBehavior: Clip.hardEdge,
      decoration: _buildDecoration(context),
      padding: padding,
      margin: margin ?? EdgeInsets.symmetric(horizontal: 40.w),
      child: _buildStoriesList(),
    );
  }

  BoxDecoration _buildDecoration(BuildContext context) {
    return BoxDecoration(
      color: backgroundColor ?? Colors.white.withOpacity(0.1),
      borderRadius: BorderRadius.circular(borderRadius ?? 100.r),
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
      separatorBuilder: (context, index) => 50.horizontalSpace,
    );
  }

  Widget _buildStoryItem(BuildContext context, int index) {
    final story = stories[index];
    return Container(
      width: 170.sp,
      height: 170.sp,
      margin: EdgeInsetsDirectional.only(
        start: index == 0 ? 20.sp : 0,
        end: index == stories.length - 1 ? 20.sp : 0,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(story.userImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
