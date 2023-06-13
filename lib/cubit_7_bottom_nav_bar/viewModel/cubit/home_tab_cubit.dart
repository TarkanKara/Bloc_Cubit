import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'home_tab_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  //void setTap(HomeTab tab) => emit(HomeState(homeTab: tab));
  void setTap(HomeTab tab) => emit(state.copWith(homeTab: tab));
}
