import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewmodel/bottom_nav_bar_cubbit.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BattomNavBarCubit(),
      child: const BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BattomNavBarCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: context.read<BattomNavBarCubit>().pageNavigation[state],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: context.read<BattomNavBarCubit>().state,
            onTap: (value) =>
                context.read<BattomNavBarCubit>().updateIndex(value),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.app_blocking), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.description), label: ""),
            ],
          ),
        );
      },
    );
  }
}
