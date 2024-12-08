
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goods_belt/features/products/domain/usecase/products_usecase.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsListState> {
  ProductsBloc() : super(ProductsListInitial()) {
    on<ProductsEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<ProductsListScreenInitEvent>((event, emit) async {
      await ProductsUsecase.productsManager.getProductsList();
    });
  }
}
