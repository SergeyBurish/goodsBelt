import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goods_belt/features/auth/presentation/bloc/auth_bloc.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: const _ProfileScreen(),
    );
  }
}

class _ProfileScreen extends StatefulWidget {
  const _ProfileScreen();

  @override
  State<_ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<_ProfileScreen> {
  @override
  void initState() {
    context.read<AuthBloc>().add(ProfileScreenInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          body: state is ProfileState 
          ? Column(
            children: [
              CachedNetworkImage(
                imageUrl: state.profile.avatar,
                progressIndicatorBuilder: (context, url, downloadProgress) => 
                  CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Text(state.profile.avatar),
              Text(state.profile.name),
              Text(state.profile.email),
            ],
          )
          : const Center(child: CircularProgressIndicator()),
        );
      },
      buildWhen: (previous, current) => current is ProfileState,
    );
  }
}
