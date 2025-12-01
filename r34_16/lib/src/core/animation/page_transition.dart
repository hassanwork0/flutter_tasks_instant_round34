part of 'animation.dart';
class CustomAnimations {
  // Fade Animation Widget
  static Widget fadeAnimation({
    required Widget child,
    required AnimationController controller,
    double begin = 0.0,
    double end = 1.0,
  }) {
    return FadeTransition(
      opacity: Tween<double>(
        begin: begin,
        end: end,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        ),
      ),
      child: child,
    );
  }

   // Scale Animation Widget
  static Widget scaleAnimation({
    required Widget child,
    required AnimationController controller,
    double begin = 0.0,
    double end = 1.0,
  }) {
    return ScaleTransition(
      scale: Tween<double>(
        begin: begin,
        end: end,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        ),
      ),
      child: child,
    );
  }

//slide
  static Widget slideAnimation({
  required Widget child,
  required AnimationController controller,
  Offset beginOffset = const Offset(-1.0, 0.0),
  Offset endOffset = const Offset(0.0, 0.0),
}) {
  return SlideTransition(
    position: Tween<Offset>(
      begin: beginOffset,
      end: endOffset,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    ),
    child: child,
  );
}

}