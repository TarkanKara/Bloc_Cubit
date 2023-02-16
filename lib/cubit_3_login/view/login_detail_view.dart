import 'package:bloc_cubit/cubit_3_login/model/login_response.dart';
import 'package:flutter/material.dart';

class LoginDetailView extends StatelessWidget {
  final LoginResponseModel model;
  const LoginDetailView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Giriş Başaralı"),
      ),
      body: Column(
        children: [
          Center(
            child: Text(model.token ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 50)),
          ),
        ],
      ),
    );
  }
}
