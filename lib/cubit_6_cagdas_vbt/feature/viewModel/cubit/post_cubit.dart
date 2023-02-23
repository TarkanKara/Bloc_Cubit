import 'package:bloc/bloc.dart';
import 'package:bloc_cubit/cubit_6_cagdas_vbt/core/network/network_manager.dart';
import 'package:bloc_cubit/cubit_6_cagdas_vbt/feature/model/post_model.dart';
import 'package:equatable/equatable.dart';

import '../../model/user_model.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial()) {
    _init();
  }

  //
  final dio = ProjectNetworkManager.instance.dio;

  //
  List<PostModel>? posDatas;
  List<UserModel>? userDatas;

  //
  bool isLoading = false;
  bool isUsers = false;

  //
  void _init() async {
    changeLoading();
    await postService();
    changeLoading();
  }

  //
  void changeLoading() {
    isLoading = !isLoading;
    emit(PostLoading());
  }

  //
  void changeUserLoading() {
    isUsers = !isUsers;
    emit(IsUserService());
  }

  //PostModel Service
  Future<List<PostModel>?> postService() async {
    try {
      var response = await dio.get("posts");
      posDatas =
          (response.data as List).map((e) => PostModel.fromJson(e)).toList();
      emit(PostService());
      return posDatas;
    } catch (e) {
      emit(PostService());
      throw Exception("PostException : $e");
    }
  }

  //UserModel Service
  Future<List<UserModel>?> userService() async {
    changeUserLoading();
    changeLoading();
    try {
      var response = await dio.get("users");
      userDatas =
          (response.data as List).map((e) => UserModel.fromJson(e)).toList();
      changeLoading();
      emit(UserService());
      return userDatas;
    } catch (e) {
      emit(UserService());
      throw Exception("UserException : $e");
    }
  }
}
