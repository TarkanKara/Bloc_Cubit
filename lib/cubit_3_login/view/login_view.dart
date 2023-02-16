// ignore_for_file: depend_on_referenced_packages

import 'package:bloc_cubit/cubit_3_login/viewmodel/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
        create: (context) =>
            LoginCubit(formKey, emailController, passwordController),
        child: buildScaffold(context));
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LoginView"),   
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  controller: emailController,
                  validator: (value) =>
                      (value ?? "").length > 5 ? null : "5 ten küçük",
                  decoration:
                      const InputDecoration(border: OutlineInputBorder())),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              TextFormField(
                  controller: passwordController,
                  validator: (value) =>
                      (value ?? "").length > 5 ? null : "5 ten küçük",
                  decoration:
                      const InputDecoration(border: OutlineInputBorder())),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              ElevatedButton(onPressed: () {}, child: const Text("Save"))
            ],
          ),
        ),
      ),
    );
  }
}
