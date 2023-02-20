import 'package:bloc_cubit/cubit_4_user_list/core/const.dart';
import 'package:bloc_cubit/cubit_4_user_list/service/service.dart';
import 'package:bloc_cubit/cubit_4_user_list/view_model/cubit/user_list_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserListCubit(
          ApiService(Dio(BaseOptions(baseUrl: BaseUrl.baseUrll)))),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("UserList"),
          centerTitle: true,
        ),
        body: BlocConsumer<UserListCubit, UserListState>(
          listener: (context, state) {},
          builder: (context, state) => Column(
            children: [
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount:
                    context.read<UserListCubit>().model?.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 0.9,
                      child: context.read<UserListCubit>().isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : ListTile(
                              leading: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: NetworkImage(
                                          context
                                                  .read<UserListCubit>()
                                                  .model!
                                                  .data?[index]
                                                  .avatar ??
                                              "",
                                        ))),
                              ),
                              title: Text(context
                                      .read<UserListCubit>()
                                      .model
                                      ?.data?[index]
                                      .firstName ??
                                  ""),
                              subtitle: Text(context
                                      .read<UserListCubit>()
                                      .model
                                      ?.data?[index]
                                      .lastName ??
                                  ""),
                              trailing: SizedBox(
                                width: 155,
                                child: Text(context
                                        .read<UserListCubit>()
                                        .model
                                        ?.data?[index]
                                        .email ??
                                    ""),
                              ),
                            ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
