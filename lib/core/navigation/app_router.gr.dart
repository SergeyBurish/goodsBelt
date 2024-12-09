// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:goods_belt/features/auth/presentation/auth_screen.dart' as _i1;
import 'package:goods_belt/features/auth/presentation/profile_screen.dart'
    as _i4;
import 'package:goods_belt/features/auth/presentation/splash_screen.dart'
    as _i5;
import 'package:goods_belt/features/products/domain/entity/product_entity.dart'
    as _i8;
import 'package:goods_belt/features/products/presentation/product_details_screen.dart'
    as _i2;
import 'package:goods_belt/features/products/presentation/products_list_screen.dart'
    as _i3;

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i6.PageRouteInfo<void> {
  const AuthRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthScreen();
    },
  );
}

/// generated route for
/// [_i2.ProductDetailsScreen]
class ProductDetailsRoute extends _i6.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    _i7.Key? key,
    required _i8.ProductEntity selectedProduct,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          ProductDetailsRoute.name,
          args: ProductDetailsRouteArgs(
            key: key,
            selectedProduct: selectedProduct,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailsRouteArgs>();
      return _i2.ProductDetailsScreen(
        key: args.key,
        selectedProduct: args.selectedProduct,
      );
    },
  );
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({
    this.key,
    required this.selectedProduct,
  });

  final _i7.Key? key;

  final _i8.ProductEntity selectedProduct;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, selectedProduct: $selectedProduct}';
  }
}

/// generated route for
/// [_i3.ProductsListScreen]
class ProductsListRoute extends _i6.PageRouteInfo<void> {
  const ProductsListRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ProductsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductsListRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.ProductsListScreen();
    },
  );
}

/// generated route for
/// [_i4.ProfileScreen]
class ProfileRoute extends _i6.PageRouteInfo<void> {
  const ProfileRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i5.SplashScreen]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.SplashScreen();
    },
  );
}
