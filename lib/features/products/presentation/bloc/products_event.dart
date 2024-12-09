part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {}

class ProductsListScreenInitEvent extends ProductsEvent{}

class ProductPressedEvent extends ProductsEvent{
  final int productId;

  ProductPressedEvent({required this.productId});
}

class LogoutPressedEvent extends ProductsEvent{}