import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goods_belt/core/navigation/app_router.gr.dart';
import 'package:goods_belt/core/presentation/widgets/decorator.dart';
import 'package:goods_belt/features/products/presentation/bloc/products_bloc.dart';

@RoutePage()
class ProductsListScreen extends StatelessWidget {
  const ProductsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsBloc(),
      child: const _ProductsListScreen(),
    );
  }
}

class _ProductsListScreen extends StatefulWidget {
  const _ProductsListScreen({super.key});

  @override
  State<_ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<_ProductsListScreen> {
  @override
  void initState() {
    context.read<ProductsBloc>().add(ProductsListScreenInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Продукты"), // L10n
            actions: [
              BlocListener<ProductsBloc, ProductsState>(
                listener: (context, state) {
                  if (state is LoggedOutState) {
                    AutoRouter.of(context).replace(const AuthRoute(),);
                  }
                },
                child: MenuAnchor(
                  builder: (BuildContext context, MenuController controller,
                      Widget? child) {
                    return ElevatedButton(
                      child: const Icon(Icons.settings),
                      onPressed: () {
                        if (controller.isOpen) {
                          controller.close();
                        } else {
                          controller.open();
                        }
                      },
                    );
                  },
                  menuChildren: [
                    MenuItemButton(
                      onPressed: () => AutoRouter.of(context).push(
                        const ProfileRoute(),
                      ),
                      child: const Icon(Icons.account_box),
                    ),
                    MenuItemButton(
                      onPressed: () => context.read<ProductsBloc>()
                        .add(LogoutPressedEvent()),
                      child: const Icon(Icons.logout),
                    )
                  ],
                ),
              )
            ],
          ),
          body: BlocListener<ProductsBloc, ProductsState>(
            listener: (context, state) {
              if (state is ProductSelectedState) {
                AutoRouter.of(context).push(ProductDetailsRoute(selectedProduct: state.selectedProduct));
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 500),
                          child: Decorator(
                            child: ListView.builder(
                              itemCount: state.products.length,
                              itemBuilder: (context, index) {
                                final product = state.products.elementAt(index);
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () => context.read<ProductsBloc>()
                                      .add(ProductPressedEvent(productId: product.id)),
                                    child: Row(
                                      children: [
                                        Expanded(child: Text(product.title)),
                                        Text("  цена ${product.price.toString()}  "), // L10n
                                        if (product.images.isNotEmpty) 
                                          CachedNetworkImage(
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.contain,
                                            imageUrl: product.images[0],
                                            progressIndicatorBuilder: (context, url, downloadProgress) => 
                                              CircularProgressIndicator(value: downloadProgress.progress),
                                            errorWidget: (context, url, error) => const Icon(Icons.error),
                                          ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      buildWhen: (previous, current) => current is ProductsListState,
    );
  }
}
