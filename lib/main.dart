import 'package:flutter/material.dart';
import 'package:goods_belt/core/navigation/app_router.dart';
import 'package:goods_belt/features/auth/data/repository/auth_repository.dart';
import 'package:goods_belt/features/auth/domain/usecase/auth_usecase.dart';

void main() {
  // dependencies
  AuthUsecase.init(AuthRepositoryImp());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
