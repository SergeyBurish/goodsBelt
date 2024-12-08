import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products.elementAt(index);
                    return InkWell(
                      onTap: () => print(index),
                      child: Row(
                        children: [
                          Text(product.title),
                          Text(product.price.toString()),
                        ],
                      ),
                    );
                  },
                )
              ),
            ],
          ),
        );
      },
      buildWhen: (previous, current) => current is ProductsListState,
    );
  }
}
