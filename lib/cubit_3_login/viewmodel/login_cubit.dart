// ignore_for_file: depend_on_referenced_packages, unused_field, prefer_final_fields

import 'package:bloc/bloc.dart';
import 'package:bloc_cubit/cubit_3_login/service/ILoginService.dart';
import 'package:flutter/cupertino.dart';

class LoginCubit extends Cubit<LoginState> {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final ILoginService service;

  bool isLogin = false;
  bool isLoading = false;

  LoginCubit(this.formKey, this.emailController, this.passwordController,
      {required this.service})
      : super(LoginInitial());

  Future<void> postUserModel() async {
    if (formKey.currentState?.validate() ?? false) {
      changeLoading();
      await Future.delayed(const Duration(seconds: 2));
      changeLoading();
    } else {
      isLogin = true;
      emit(LoginValidateState(isLogin));
    }
  }

  void changeLoading() {
    isLoading = !isLoading;
    emit(LoginLoadingState(isLoading));
  }
}

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginValidateState extends LoginState {
  final bool isValidate;

  LoginValidateState(this.isValidate);
}

class LoginLoadingState extends LoginState {
  final bool isLoading;

  LoginLoadingState(this.isLoading);
}
