// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:goods_belt/features/auth/presentation/auth_screen.dart' as _i1;
import 'package:goods_belt/features/auth/presentation/profile_screen.dart'
    as _i3;
import 'package:goods_belt/features/auth/presentation/splash_screen.dart'
    as _i4;
import 'package:goods_belt/features/products/presentation/products_list_screen.dart'
    as _i2;

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i5.PageRouteInfo<void> {
  const AuthRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthScreen();
    },
  );
}

/// generated route for
/// [_i2.ProductsListScreen]
class ProductsListRoute extends _i5.PageRouteInfo<void> {
  const ProductsListRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ProductsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductsListRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.ProductsListScreen();
    },
  );
}

/// generated route for
/// [_i3.ProfileScreen]
class ProfileRoute extends _i5.PageRouteInfo<void> {
  const ProfileRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i4.SplashScreen]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplashScreen();
    },
  );
}
