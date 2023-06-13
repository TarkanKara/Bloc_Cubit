import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart' show immutable;

import '../../core/extension/app_extension.dart';
import '../../model/users_model.dart';

part 'user_event.dart';
part 'user_state.dart';

typedef PersonLoader = Future<List<User>> Function(UserURL);

class UserBloc extends Bloc<LoadPersonEvent, FetchResultState?> {
  UserBloc() : super(null) {
    on(_onLoadPerson);
  }

  final Map<UserURL, Iterable<User>> _cached = {};

  void _onLoadPerson(
      LoadPersonEvent event, Emitter<FetchResultState?> emit) async {
    final UserURL url = event.url;

    if (_cached.containsKey(url)) {
      final cachedUsers = _cached[url]!;
      final result =
          FetchResultState(isCache: true, users: cachedUsers.toList());
      emit(result);
      "Data From Cache".log();
    } else {
      final personLoader = event.onLoader;
      final userFromService = await personLoader(url);
      _cached[url] = userFromService;
      emit(FetchResultState(isCache: false, users: userFromService));
      "Data From Service".log();
    }
  }
}
