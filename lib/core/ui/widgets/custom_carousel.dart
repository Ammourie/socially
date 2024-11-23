import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../common/app_colors.dart';
import '../../theme/text_theme_styles.dart';

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({
    super.key,
    required this.items,
    this.carouselController,
    this.disableGesture,
    this.animateToClosest = true,
    this.padEnds = true,
    this.enableInfiniteScroll = true,
    this.autoPlay = false,
    this.reverse = false,
    this.aspectRatio = 16 / 9,
    this.viewportFraction = 0.8,
    this.enlargeFactor = 0.3,
    this.initialPage = 0,
    this.carouselBorderRadius = 0,
    this.carouselContainerBorderRadius = 0,
    this.height,
    this.enlargeCenterPage,
    this.autoPlayAnimationDuration = const Duration(milliseconds: 800),
    this.autoPlayInterval = const Duration(seconds: 4),
    this.autoPlayCurve = Curves.fastOutSlowIn,
    this.clipBehavior = Clip.hardEdge,
    this.onPageChanged,
    this.scrollPhysics,
    this.backgroundColor,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.titlePadding = EdgeInsets.zero,
    this.title,
    this.titleStyle,
    this.carouselContainerBorder,
  });
  final double carouselBorderRadius, carouselContainerBorderRadius;
  final EdgeInsetsGeometry padding, margin, titlePadding;
  final List<Widget> items;
  final CarouselSliderController? carouselController;
  final bool? disableGesture, enlargeCenterPage;
  final bool animateToClosest, autoPlay, padEnds, enableInfiniteScroll, reverse;
  final double aspectRatio, viewportFraction, enlargeFactor;
  final double? height;
  final Duration autoPlayAnimationDuration, autoPlayInterval;
  final Curve autoPlayCurve;
  final Clip clipBehavior;
  final int initialPage;
  final Function(int, CarouselPageChangedReason)? onPageChanged;
  final ScrollPhysics? scrollPhysics;
  final Color? backgroundColor;
  final String? title;
  final TextStyle? titleStyle;
  final BoxBorder? carouselContainerBorder;
  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  late CarouselSliderController _controller;
  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    if (widget.carouselController == null) {
      _controller = CarouselSliderController();
    } else {
      _controller = widget.carouselController!;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) return const SizedBox.shrink();
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        border: widget.carouselContainerBorder,
        borderRadius: BorderRadius.circular(
          widget.carouselContainerBorderRadius,
        ),
      ),
      padding: widget.padding,
      margin: widget.margin,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.title != null) ...{
            _buildTitleRow(),
            12.verticalSpace,
          },
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _buildCarousel(),
              _buildIndicator(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator() {
    return Positioned(
      bottom: 16.sp,
      child: SmoothPageIndicator(
        controller: PageController(initialPage: _currentPage),
        count: widget.items.length,
        effect: WormEffect(
          dotHeight: 8.sp,
          dotWidth: 8.sp,
          spacing: 8.sp,
          activeDotColor: Colors.white,
          dotColor: Colors.grey,
        ),
        onDotClicked: (index) {
          _controller.animateToPage(index);
        },
      ),
    );
  }

  Padding _buildTitleRow() {
    return Padding(
      padding: widget.titlePadding,
      child: Row(
        children: [
          _buildTitle(),
          const Spacer(),
        ],
      ),
    );
  }

  Text _buildTitle() {
    return Text(
      widget.title!,
      style: widget.titleStyle ??
          TextThemeStyles.robotoBold.copyWith(
            color: AppColors.primaryColorLight,
          ),
    );
  }

  ClipRRect _buildCarousel() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.carouselBorderRadius),
      child: CarouselSlider(
        items: widget.items,
        options: CarouselOptions(
          animateToClosest: widget.animateToClosest,
          autoPlay: widget.autoPlay,
          aspectRatio: widget.aspectRatio,
          height: widget.height,
          autoPlayAnimationDuration: widget.autoPlayAnimationDuration,
          autoPlayCurve: widget.autoPlayCurve,
          autoPlayInterval: widget.autoPlayInterval,
          clipBehavior: widget.clipBehavior,
          enlargeCenterPage: widget.enlargeCenterPage,
          viewportFraction: widget.viewportFraction,
          padEnds: widget.padEnds,
          enableInfiniteScroll: widget.enableInfiniteScroll,
          enlargeFactor: widget.enlargeFactor,
          reverse: widget.reverse,
          initialPage: widget.initialPage,
          onPageChanged: (index, reason) {
            _currentPage = index;
            widget.onPageChanged?.call(_currentPage, reason);

            setState(() {});
          },
          scrollPhysics: widget.scrollPhysics,
        ),
        carouselController: _controller,
        disableGesture: widget.disableGesture,
      ),
    );
  }
}
