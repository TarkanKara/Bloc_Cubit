import 'package:flutter/material.dart';

import '../../feature/model/user_model.dart';

class CustomUserListView extends StatelessWidget {
  const CustomUserListView({
    super.key,
    required this.itemCount,
    this.userText,
  });
  final int itemCount;
  final List<UserModel>? userText;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: ListTile(
              leading: Text(userText?[index].id.toString() ?? ""),
              title: Text(userText?[index].name ?? ""),
              subtitle: Text(userText?[index].email ?? ""),
            ),
          ),
        );
      },
    );
  }
}