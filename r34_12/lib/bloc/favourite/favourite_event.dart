import '../../entity/product.dart';

abstract class FavouriteEvent {}

class AddFavourite extends FavouriteEvent {
  final Product product;
  AddFavourite(this.product);
}

class RemoveFavourite extends FavouriteEvent {
  final Product product;
  RemoveFavourite(this.product);
}

class ClearAllFavourites extends FavouriteEvent {}