part of 'animation.dart';

class CustomPageRoute<T> extends PageRouteBuilder<T> { 
  final Widget page; //page that iam going to
  final PageTransitionType transitionType;

  CustomPageRoute({
    required this.page,
    this.transitionType = PageTransitionType.fade,
  }) : super( //super, parameters when i pass them not when i do object from CustomPageRoute but in that class PageRouteBuilder
  //so instead of saying super. , i used it as a method, and to not write all that in the pages all these
          pageBuilder: (context, animation, secondaryAnimation) => page, //returns the page after the logic is put which is the second paramtere
          transitionsBuilder: (context, animation, secondaryAnimation, child) { // this is the second parametre
            //so this function transitionsBuilder will be implemented first before the page gets retunred
            switch (transitionType) { //enum cases  
              case PageTransitionType.fade:
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              case PageTransitionType.scale:
                return ScaleTransition(
                  scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeInOut,
                    ),
                  ),
                  child: child,
                );
                case PageTransitionType.slideRight:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              case PageTransitionType.slideLeft:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              case PageTransitionType.slideUp:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0.0, 1.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              case PageTransitionType.slideDown:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0.0, -1.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
            }
          },
        );
}