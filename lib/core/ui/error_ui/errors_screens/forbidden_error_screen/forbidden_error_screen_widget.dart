part of '../error_widget.dart';

class ForbiddenErrorScreenWidget extends StatefulWidget {
  const ForbiddenErrorScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  _ForbiddenErrorScreenWidgetState createState() =>
      _ForbiddenErrorScreenWidgetState();
}

class _ForbiddenErrorScreenWidgetState extends State<ForbiddenErrorScreenWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildErrorScreen(
      callback: null,
      context: context,
      disableRetryButton: false,
      title: S.current.forbidden,
      imageUrl: AppConstants.ERROR_403_401,
      errorAnimation: ErrorAnimation(
        animUrl: AppConstants.ANIM_LOTTIE_ERROR_403_401,
        animationController: _controller,
      ),
    );
  }
}
