import '../../entity/product.dart';

abstract class FavouriteState {
  final List<Product> favourites;
  FavouriteState(this.favourites);
}

class FavouriteInitial extends FavouriteState {
  FavouriteInitial([List<Product>? favourites]) 
      : super(favourites ?? []);
}

class FavouriteLoaded extends FavouriteState {
  FavouriteLoaded(super.favourites);
}

class FavouriteError extends FavouriteState {
  final String message;
  FavouriteError(this.message) : super([]);
}