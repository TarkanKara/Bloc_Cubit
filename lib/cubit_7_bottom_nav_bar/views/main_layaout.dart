// ignore_for_file: unused_local_variable


import 'package:bloc_cubit/cubit_7_bottom_nav_bar/views/page_one.dart';
import 'package:bloc_cubit/cubit_7_bottom_nav_bar/views/page_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewModel/cubit/home_tab_cubit.dart';
import '../widgets/home_tab_button.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(), child: const HomeView()),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab = context
        .select<HomeCubit, HomeTab>((HomeCubit cubit) => cubit.state.homeTab);
    return Scaffold(
      body: IndexedStack(index: selectedTab.index, children: const [
        PageOne(),
        PageTwo(),
      ]),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeTabButton(
              index: HomeTab.page1,
              selectedIndex: selectedTab,
              iconData: Icons.home,
            ),
            HomeTabButton(
              index: HomeTab.page2,
              selectedIndex: selectedTab,
              iconData: Icons.settings,
            ),
          ],
        ),
      ),
    );
  }
}
