import 'package:bloc_cubit/cubit_5_bottom_nav_bar/widget/page_1_view.dart';
import 'package:bloc_cubit/cubit_5_bottom_nav_bar/widget/page_2_view.dart';
import 'package:bloc_cubit/cubit_5_bottom_nav_bar/widget/page_3_view.dart';
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

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final pageNavigation = [
    const Page1View(),
    const Page2View(),
    const Page3View(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BattomNavBarCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: pageNavigation.elementAt(state),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: context.read<BattomNavBarCubit>().state,
            onTap: changeBottomNav,
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

  void changeBottomNav(int index) {
    context.read<BattomNavBarCubit>().updateIndex(index);
  }
}
