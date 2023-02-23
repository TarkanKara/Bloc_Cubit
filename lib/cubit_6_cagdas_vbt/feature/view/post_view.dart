import 'package:bloc_cubit/cubit_6_cagdas_vbt/feature/viewModel/cubit/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider<PostCubit>(
        create: (context) => PostCubit(),
        child: Column(
          children: [
            Expanded(
              child: BlocConsumer<PostCubit, PostState>(
                listener: (context, state) {},
                builder: (context, state) => context.read<PostCubit>().isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: ListTile(
                                leading: Text(
                                  context
                                          .read<PostCubit>()
                                          .posDatas?[index]
                                          .id
                                          .toString() ??
                                      "",
                                ),
                                title: Text(
                                  context
                                          .read<PostCubit>()
                                          .posDatas?[index]
                                          .title
                                          .toString() ??
                                      "",
                                ),
                                subtitle: Text(
                                  context
                                          .read<PostCubit>()
                                          .posDatas?[index]
                                          .body
                                          .toString() ??
                                      "",
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
