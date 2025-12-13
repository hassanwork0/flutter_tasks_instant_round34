abstract class HomeEvent {}

class LoadHomeProducts extends HomeEvent {}

class SearchProducts extends HomeEvent {
  final String query;
  SearchProducts(this.query);
}
