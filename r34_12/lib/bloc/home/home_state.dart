import '../../entity/product.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Product> offers;
  final List<Product> bestSelling;

  HomeLoaded({required this.offers, required this.bestSelling});
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
