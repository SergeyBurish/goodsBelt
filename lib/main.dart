import 'package:flutter/material.dart';
import 'package:goods_belt/features/auth/data/repository/auth_repository.dart';
import 'package:goods_belt/features/auth/domain/usecase/auth_usecase.dart';
import 'package:goods_belt/features/auth/presentation/auth_screen.dart';

void main() {
  // dependencies
  AuthUsecase.init(AuthRepositoryImp());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthScreen(),
    );
  }
}
