import 'dart:convert';

import 'package:flutter/foundation.dart' show immutable;
import 'package:http/http.dart' as http;

import '../core/extension/app_extension.dart';
import '../model/users_model.dart';

typedef MyHttpClient = http.Client;

@immutable
class UserService {
  final MyHttpClient httpClient;
  UserService() : httpClient = MyHttpClient();

  Future<List<User>> fetchUser(UserURL userURL) async {
    final response = await httpClient.get(Uri.parse(userURL.urlToString));

    return (json.decode(response.body) as List<dynamic>)
        .map((dynamic user) => User.fromJson(UserMap.from(user)))
        .cast<User>()
        .toList();
  }
}
