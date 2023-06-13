import 'package:flutter/material.dart';

import '../core/extension/app_extension.dart';

class UserListTile<T> extends StatelessWidget {
  final Iterable<T> users;
  const UserListTile({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: users.length,
      itemBuilder: (context, index) {
        return ListTile(title: Text(users[index].toString()));
      },
    );
  }
}
