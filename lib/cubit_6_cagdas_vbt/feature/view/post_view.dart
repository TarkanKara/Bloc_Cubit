import 'package:bloc_cubit/cubit_6_cagdas_vbt/feature/viewModel/cubit/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../product/widget/post_list_view.dart';
import '../../product/widget/user_list_view.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Cubit Example")),
      body: BlocProvider<PostCubit>(
        create: (context) => PostCubit(),
        child: BlocConsumer<PostCubit, PostState>(
          listener: (context, state) {},
          builder: (context, state) {
            return context.read<PostCubit>().isLoading
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Expanded(
                        child: context.read<PostCubit>().isUsers
                            ? CustomUserListView(
                                itemCount:
                                    context.read<PostCubit>().userDatas!.length,
                                userText: context.read<PostCubit>().userDatas,
                              )
                            : CustomPostListView(
                                itemCount:
                                    context.read<PostCubit>().posDatas!.length,
                                postText: context.read<PostCubit>().posDatas,
                              ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            context.read<PostCubit>().userService();
                          },
                          child: const Text("Is Users"))
                    ],
                  );
          },
        ),
      ),
    );
  }
}
