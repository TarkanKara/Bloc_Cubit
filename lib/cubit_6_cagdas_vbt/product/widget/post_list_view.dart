import 'package:flutter/material.dart';

import '../../feature/model/post_model.dart';

class CustomPostListView extends StatelessWidget {
  const CustomPostListView({
    super.key,
    required this.itemCount,
    this.postText,
  });
  final int itemCount;
  final List<PostModel>? postText;
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
              leading: Text(postText?[index].id.toString() ?? ""),
              title: Text(postText?[index].title ?? ""),
              subtitle: Text(postText?[index].body ?? ""),
            ),
          ),
        );
      },
    );
  }
}
