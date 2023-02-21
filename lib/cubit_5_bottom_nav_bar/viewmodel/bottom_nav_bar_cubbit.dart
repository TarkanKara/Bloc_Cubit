import 'package:bloc/bloc.dart';

class BattomNavBarCubit extends Cubit<int> {
  BattomNavBarCubit() : super(0);

  void updateIndex(int index) => emit(index);
}
