import 'package:bloc_cubit/cubit_4_user_list/model/user_list_model.dart';

import 'IService.dart';

class ApiService extends IService {
  ApiService(super.dio);

  @override
  Future<UserListModel?> fetchUserListData() async {
    final response = await dio.get(userList_path);
    if (response.statusCode == 200) {
      return UserListModel.fromJson(response.data);
    }
    return null;
  }
}
