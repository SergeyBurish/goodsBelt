part of 'products_bloc.dart';

@immutable
sealed class ProductsState {
  List<ProductEntity> get products => [];
}

final class ProductsInitial extends ProductsState {}

final class ProductsListState extends ProductsState {
  final List<ProductEntity> _products;

  ProductsListState({required List<ProductEntity> products}) : _products = products;

  @override
  List<ProductEntity> get products => _products;
}

final class LoggedOutState extends ProductsState {}
