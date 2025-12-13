import 'package:flutter_bloc/flutter_bloc.dart';
import '../../entity/product.dart';
import 'favourite_event.dart';
import 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(FavouriteInitial([])) {
    on<AddFavourite>(_onAddFavourite);
    on<RemoveFavourite>(_onRemoveFavourite);
    on<ClearAllFavourites>(_onClearAll);
  }

  void _onAddFavourite(AddFavourite event, Emitter<FavouriteState> emit) {
    print('Adding product to favourites: ${event.product.id}');
    
    final currentFavourites = List<Product>.from(state.favourites);
    
    // تحقق إذا المنتج موجود بالفعل
    final exists = currentFavourites.any((p) => p.id == event.product.id);
    
    if (!exists) {
      currentFavourites.add(event.product);
      print('Product added. Total favourites: ${currentFavourites.length}');
      emit(FavouriteLoaded(currentFavourites));
    } else {
      print('Product already exists in favourites');
    }
  }

  void _onRemoveFavourite(RemoveFavourite event, Emitter<FavouriteState> emit) {
    print('Removing product from favourites: ${event.product.id}');
    
    final currentFavourites = List<Product>.from(state.favourites);
    currentFavourites.removeWhere((p) => p.id == event.product.id);
    
    print('Product removed. Total favourites: ${currentFavourites.length}');
    emit(FavouriteLoaded(currentFavourites));
  }

  void _onClearAll(ClearAllFavourites event, Emitter<FavouriteState> emit) {
    print('Clearing all favourites');
    emit(FavouriteLoaded([]));
  }
}