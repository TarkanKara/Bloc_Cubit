import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewModel/cubit/home_tab_cubit.dart';

class HomeTabButton extends StatelessWidget {
  final HomeTab index;
  final HomeTab selectedIndex;
  final IconData iconData;

  const HomeTabButton({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<HomeCubit>().setTap(index),
      icon: Icon(iconData, size: 25),
      color: selectedIndex != index
          ? null
          : Theme.of(context).colorScheme.secondary,
    );
  }
}
