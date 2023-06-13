// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedproducts;
  HomeProductWishlistButtonClickedEvent({
    required this.clickedproducts,
  });
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedproducts;
  HomeProductCartButtonClickedEvent({
    required this.clickedproducts,
  });
}
