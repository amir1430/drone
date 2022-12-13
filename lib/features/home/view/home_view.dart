import 'package:drone/features/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomePage(),
      drawer: context.watch<HomeBloc>().state.status == HomeStatus.success
          ? const HomeDrawer()
          : null,
    );
  }
}
