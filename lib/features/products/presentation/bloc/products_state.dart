part of 'products_bloc.dart';

@immutable
sealed class ProductsState {
  ProductEntity get selectedProduct => ProductEntity.empty();
  List<ProductEntity> get products => [];
}

final class ProductsInitial extends ProductsState {}

final class ProductsListState extends ProductsState {
  final List<ProductEntity> _products;

  ProductsListState({required List<ProductEntity> products}) : _products = products;

  @override
  List<ProductEntity> get products => _products;
}

final class ProductSelectedState extends ProductsState {
  final ProductEntity _selectedProduct;

  ProductSelectedState({required ProductEntity selectedProduct}) : _selectedProduct = selectedProduct;

  @override
  ProductEntity get selectedProduct => _selectedProduct;
}

final class LoggedOutState extends ProductsState {}
