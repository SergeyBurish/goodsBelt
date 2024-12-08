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
    return const Scaffold(
      body: Center(child: Text("ProductsList")),
    );
  }
}
