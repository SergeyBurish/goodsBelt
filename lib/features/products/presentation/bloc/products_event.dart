part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {}

class ProductsListScreenInitEvent extends ProductsEvent{}