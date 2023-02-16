// ignore_for_file: depend_on_referenced_packages

import 'package:bloc_cubit/cubit_3_login/service/login_service.dart';
import 'package:bloc_cubit/cubit_3_login/viewmodel/login_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final String baseUrl = "https://reqres.in/api/";

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(
              formKey,
              emailController,
              passwordController,
              service: LoginService(Dio(BaseOptions(baseUrl: baseUrl))),
            ),
        child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {},
            builder: (context, state) => buildScaffold(context, state)));
  }

  Scaffold buildScaffold(BuildContext context, LoginState state) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Form(
        key: formKey,
        autovalidateMode: autpValidateMode(state),
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTextFormFieldEmail(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              buildTextFormFieldPassword(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              ElevatedButton(
                onPressed: context.watch<LoginCubit>().isLoading
                    ? null
                    : () {
                        context.read<LoginCubit>().postUserModel();
                      },
                child: context.read<LoginCubit>().isLoading
                    ? const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(color: Colors.orange),
                      )
                    : const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        title: const Text("Cubit Login"),
        centerTitle: true,
        leading: Visibility(
          visible: context.watch<LoginCubit>().isLoading,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircularProgressIndicator(color: Colors.orange),
          ),
        ));
  }

  AutovalidateMode autpValidateMode(LoginState state) {
    return state is LoginValidateState
        ? (state.isValidate
            ? AutovalidateMode.always
            : AutovalidateMode.disabled)
        : AutovalidateMode.disabled;
  }

  TextFormField buildTextFormFieldPassword() {
    return TextFormField(
      controller: passwordController,
      validator: (value) => (value ?? "").length > 5 ? null : "5 ten küçük",
      decoration: const InputDecoration(
          border: OutlineInputBorder(), labelText: "Password"),
    );
  }

  TextFormField buildTextFormFieldEmail() {
    return TextFormField(
      controller: emailController,
      validator: (value) => (value ?? "").length > 5 ? null : "5 ten küçük",
      decoration: const InputDecoration(
          border: OutlineInputBorder(), labelText: "Email"),
    );
  }
}
