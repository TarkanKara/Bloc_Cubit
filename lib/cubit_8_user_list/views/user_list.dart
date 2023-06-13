import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../extension/app_extension.dart';
import '../viewModels/bloc/user_bloc.dart';
import '../widgets/fetch_user_button.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (_) => UserBloc(),
      child: const UsersView(),
    );
  }
}

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Users Page"), centerTitle: true),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FetchUserButton(
                      textButton: "User 1 List", userURL: UserURL.user1),
                  FetchUserButton(
                      textButton: "User 1 List", userURL: UserURL.user2),
                ],
              ),
            ),
            const SizedBox(height: 30),
            BlocBuilder<UserBloc, FetchResultState?>(
                builder: (context, FetchResultState? state) {
              return state != null
                  ? state.users.itemToWidget()
                  //UserListTile<List<User>>(users: state.users)
                  //UserListTile(users: state.users)
                  : const Center(child: Text("Null"));
            })
          ],
        ),
      ),
    );
  }
}
