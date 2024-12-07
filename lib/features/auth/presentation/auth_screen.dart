import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goods_belt/features/auth/presentation/bloc/auth_bloc.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: const _AuthScreen(),
    );
  }
}

class _AuthScreen extends StatefulWidget {
  const _AuthScreen();

  @override
  State<_AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<_AuthScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AuthScreen"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: "Email"),
            controller: emailController,
          ),
          TextField(
            decoration: const InputDecoration(labelText: "Password"),
            controller: passwordController,
          ),
          ElevatedButton(
            onPressed: () {
              context.read<AuthBloc>().add(LoginPressedEvent(
                email: emailController.text, password: passwordController.text));
            }, 
            child: const Text("Login")
          )
        ],
      ),
    );
  }
}
