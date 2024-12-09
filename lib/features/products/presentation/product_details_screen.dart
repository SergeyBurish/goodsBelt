import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:goods_belt/core/presentation/widgets/decorator.dart';
import 'package:goods_belt/features/products/domain/entity/product_entity.dart';

@RoutePage()
class ProductDetailsScreen extends StatelessWidget {
  final ProductEntity selectedProduct;
  const ProductDetailsScreen({super.key, required this.selectedProduct});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500, maxHeight: 600),
              child: Decorator(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (selectedProduct.images.isNotEmpty) 
                        CachedNetworkImage(
                          width: 350,
                          height: 350,
                          fit: BoxFit.contain,
                          imageUrl: selectedProduct.images[0],
                          progressIndicatorBuilder: (context, url, downloadProgress) => 
                            CircularProgressIndicator(value: downloadProgress.progress),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      const SizedBox(height: 10.0,),
                      Text(
                        selectedProduct.title,
                        style: Theme.of(context).textTheme.headlineMedium
                      ),
                      const SizedBox(height: 10.0,),
                      Text("цена: ${selectedProduct.price}"), // L10n
                      const SizedBox(height: 10.0,),
                      Text(selectedProduct.description),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
