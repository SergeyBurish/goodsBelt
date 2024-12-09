import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:goods_belt/core/presentation/widgets/decorator.dart';
import 'package:goods_belt/features/products/domain/entity/product_entity.dart';

@RoutePage()
class ProductDetailsScreen extends StatefulWidget {
  final ProductEntity selectedProduct;
  const ProductDetailsScreen({super.key, required this.selectedProduct});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

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
                      if (widget.selectedProduct.images.isNotEmpty) 
                        SizedBox(
                          height: 400,
                          child: PageView(
                            controller: _controller,
                            onPageChanged: (page) {
                              setState(() {_currentPage = page;});
                            },
                            children: widget.selectedProduct.images.map<CachedNetworkImage>((imageUrl) {
                              return CachedNetworkImage(
                                width: 350,
                                height: 350,
                                fit: BoxFit.contain,
                                imageUrl: imageUrl,
                                progressIndicatorBuilder: (context, url, downloadProgress) => 
                                  Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                              );
                            }).toList(),
                          ),
                        ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List<Widget>.generate(widget.selectedProduct.images.length, (index) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              color: _currentPage == index 
                                ? Theme.of(context).colorScheme.inverseSurface
                                : Theme.of(context).colorScheme.inverseSurface.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 10.0,),
                      Text(
                        widget.selectedProduct.title,
                        style: Theme.of(context).textTheme.headlineMedium
                      ),
                      const SizedBox(height: 10.0,),
                      Text("цена: ${widget.selectedProduct.price}"), // L10n
                      const SizedBox(height: 10.0,),
                      Text(widget.selectedProduct.description),
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
