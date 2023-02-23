import 'package:bloc/bloc.dart';
import 'package:bloc_cubit/cubit_6_cagdas_vbt/core/network/network_manager.dart';
import 'package:bloc_cubit/cubit_6_cagdas_vbt/feature/model/post_model.dart';
import 'package:equatable/equatable.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial()) {
    _init();
  }

  final dio = ProjectNetworkManager.instance.dio;
  List<PostModel>? posDatas;

  bool isLoading = false;

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
      throw Exception("Exception : $e");
    }
  }
}
