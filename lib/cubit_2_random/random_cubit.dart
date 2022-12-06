// ignore_for_file: depend_on_referenced_packages

import 'dart:math' as math show Random;
import 'package:flutter_bloc/flutter_bloc.dart';

extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(math.Random().nextInt(length));
}

class NamesCubit extends Cubit {
  NamesCubit({required this.userList}) : super(null);
  final Iterable<String> userList;
  void getRandomName() => emit(userList.getRandomElement());
}
