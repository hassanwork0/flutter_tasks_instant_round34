part of 'routes.dart';

class RoutesHandler {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.entryPoint:
        return MaterialPageRoute(builder: (context) => const EntryPointUi());
      case RoutesName.ournewitemdetails:
        final args = settings.arguments as ProductEntity;
        return MaterialPageRoute(
          builder: (context) => OurNewItemDetails(product: args),
        );
      case RoutesName.popularpackdetails:
        final args = settings.arguments as ProductEntity;
        return MaterialPageRoute(
          builder: (context) => PopularPackDetails(product: args),
        );
      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text('No Route defined'))),
        );
    }
  }

  //helper method for navigation with animation
  static void navigateTo(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  //helper method for navigation with replacement and animation

  static void navigateReplaceTo(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }
}
