import 'dart:developer' as devtools show log;

import 'package:bloc_cubit/cubit_8_user_list/widgets/user_list_tile.dart';
import 'package:flutter/material.dart';

const _userURL1 = "http://127.0.0.1:5500/lib/cubit_8_user_list/api/users1.json";
const _userURL2 = "http://127.0.0.1:5500/lib/cubit_8_user_list/api/users2.json";

enum UserURL { user1, user2 }

extension UserURLX on UserURL {
  String get urlToString {
    switch (this) {
      case UserURL.user1:
        return _userURL1;
      case UserURL.user2:
        return _userURL2;
    }
  }
}

extension IsEqualOrIgnoring<T> on Iterable<T> {
  bool isEqualOrIgnoring(Iterable<T> other) {
    return length == other.length &&
        {...this}.intersection({...other}).length == length;
  }
}

extension Log on Object {
  void log() => devtools.log(toString());
}

extension SubScript<T> on Iterable<T> {
  T? operator [](int atIndex) => length > atIndex ? elementAt(atIndex) : null;
}

extension ItemToList<T> on Iterable<T> {
  Widget itemToWidget() => UserListTile(users: this);
}
