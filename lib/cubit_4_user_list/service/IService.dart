// ignore_for_file: non_constant_identifier_names, file_names

import 'package:bloc_cubit/cubit_4_user_list/core/extension/network_path.dart';
import 'package:dio/dio.dart';

import '../model/user_list_model.dart';

abstract class IService {
  final Dio dio;

  IService(this.dio);

  final String userList_path = IServicePath.USER_LIST.rawValue;

  Future<UserListModel?> fetchUserListData();
}
