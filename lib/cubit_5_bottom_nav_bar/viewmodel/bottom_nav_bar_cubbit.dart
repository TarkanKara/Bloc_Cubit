import 'package:bloc/bloc.dart';
import 'package:bloc_cubit/cubit_5_bottom_nav_bar/widget/page_2_view.dart';
import 'package:bloc_cubit/cubit_5_bottom_nav_bar/widget/page_3_view.dart';
import 'package:flutter/widgets.dart';

import '../widget/page_1_view.dart';

class BattomNavBarCubit extends Cubit<int> {
  BattomNavBarCubit() : super(0);

  List<Widget> pageNavigation = [
    const Page1View(),
    const Page2View(),
    const Page3View(),
  ];

  void updateIndex(int index) => emit(index);
}
