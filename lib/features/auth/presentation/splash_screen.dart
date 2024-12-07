import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goods_belt/core/navigation/app_router.gr.dart';
import 'package:goods_belt/features/auth/presentation/bloc/auth_bloc.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: const _SplashScreen(),
    );
  }
}

class _SplashScreen extends StatefulWidget {
  const _SplashScreen({super.key});

  @override
  State<_SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<_SplashScreen> {
  @override
  void initState() {
    context.read<AuthBloc>().add(SplashScreenInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoggedInState) {
          AutoRouter.of(context).replace(const ProductsListRoute(),);
        } else {
          AutoRouter.of(context).replace(const AuthRoute(),);
        }
      },
      child: const Scaffold(
        body: Center(child: Text("SplashScreen")),
      ),
    );
  }
}
