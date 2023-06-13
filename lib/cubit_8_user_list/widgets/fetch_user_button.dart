import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/extension/app_extension.dart';
import '../service/user_services.dart';
import '../viewModels/bloc/user_bloc.dart';

class FetchUserButton extends StatelessWidget {
  final UserURL userURL;
  final String textButton;
  const FetchUserButton({
    super.key,
    required this.userURL,
    required this.textButton,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          context.read<UserBloc>().add(
                LoadPersonEvent(
                    onLoader: UserService().fetchUser, url: userURL),
              );
        },
        child: Text(textButton));
  }
}
