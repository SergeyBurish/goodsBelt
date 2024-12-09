
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goods_belt/features/products/domain/entity/product_entity.dart';
import 'package:goods_belt/features/products/domain/usecase/products_usecase.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<ProductsListScreenInitEvent>((event, emit) async {
      final products = await ProductsUsecase.productsManager.getProductsList();
      emit(ProductsListState(products: products));
    });

    on<LogoutPressedEvent>((event, emit) async {
      await ProductsUsecase.productsManager.logout();
      emit(LoggedOutState());
    });
  }
}
