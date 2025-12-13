import 'package:flutter_bloc/flutter_bloc.dart';
import '../../entity/product.dart';
import '../../source/data.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Data data;
  List<Product> allProducts = [];

  HomeBloc(this.data) : super(HomeInitial()) {
    on<LoadHomeProducts>(_onLoadProducts);
    on<SearchProducts>(_onSearchProducts);
  }

  Future<void> _onLoadProducts(
      LoadHomeProducts event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      allProducts = await data.getAllProducts();
      final offers = allProducts.length >= 3 ? allProducts.sublist(0, 3).cast<Product>() : allProducts.cast<Product>();
      final bestSelling = allProducts.length > 3 ? allProducts.sublist(3).cast<Product>() : <Product>[];

      emit(HomeLoaded(offers: offers, bestSelling: bestSelling));
    } catch (e) {
      emit(HomeError("Failed to load products"));
    }
  }

  void _onSearchProducts(SearchProducts event, Emitter<HomeState> emit) {
    try {
      final filtered = allProducts
          .where((p) => p.title.toLowerCase().contains(event.query.toLowerCase()))
          .toList();

      if (filtered.isEmpty && event.query.isNotEmpty) {
        emit(HomeLoaded(offers: [], bestSelling: [])); // Emit empty lists if no products found for the search query
        return;
      }
      
      final offers = filtered.length >= 3 ? filtered.sublist(0, 3).cast<Product>() : filtered.cast<Product>();
      final bestSelling = filtered.length > 3 ? filtered.sublist(3).cast<Product>() : <Product>[];

      emit(HomeLoaded(offers: offers, bestSelling: bestSelling));
    } catch (e) {
      emit(HomeError("Error searching products"));
    }
  }
}
