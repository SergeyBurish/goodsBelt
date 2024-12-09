import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goods_belt/core/navigation/app_router.gr.dart';
import 'package:goods_belt/core/presentation/widgets/decorator.dart';
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
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoggedInState) {
          AutoRouter.of(context).replace(const ProductsListRoute(),);
        } 
        // else if (state is LoggedOutState) {
        //   TODO: show error
        // }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Вход в личный кабинет"), // L10n
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500, maxHeight: 300),
                child: Decorator(
                  child: Column(
                    children: [
                      TextField(
                        decoration: const InputDecoration(labelText: "Email"),
                        controller: emailController,
                      ),
                      const SizedBox(height: 10.0,),
                      TextField(
                        obscureText: true,
                        decoration: const InputDecoration(labelText: "Password"),
                        controller: passwordController,
                      ),
                      const SizedBox(height: 10.0,),
                      ElevatedButton(
                        onPressed: () => context.read<AuthBloc>().add(
                          LoginPressedEvent(
                            email: emailController.text,
                            password: passwordController.text)),
                        child: const Text("Войти") // L10n
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
