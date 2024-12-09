import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:goods_belt/features/products/domain/entity/product_entity.dart';

@RoutePage()
class ProductDetailsScreen extends StatelessWidget {
  final ProductEntity selectedProduct;
  const ProductDetailsScreen({super.key, required this.selectedProduct});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text("ProductDetailsScreen Upp ${selectedProduct.id}")
    );
  }
}
