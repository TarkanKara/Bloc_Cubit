import 'package:bloc/bloc.dart';
import 'package:bloc_cubit/cubit_4_user_list/model/user_list_model.dart';
import 'package:bloc_cubit/cubit_4_user_list/service/IService.dart';
import 'package:equatable/equatable.dart';

part 'user_list_state.dart';

class UserListCubit extends Cubit<UserListState> {
  final IService service;
  UserListModel? model;

  bool isLoading = false;

  UserListCubit(this.service) : super(UserListInitial()) {
    fetchUserList();
  }

  Future<UserListModel?> fetchUserList() async {
    emit(UserListLoading(isLoading));
    model = await service.fetchUserListData();
    emit(UserListCompleted(userListModel: model));
    return model;
  }

  /* cahangeLoading() {
    isLoading = !isLoading;
    emit(UserListLoading(isLoading));
  } */
}
