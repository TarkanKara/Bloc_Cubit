// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class LoginCubit extends Cubit<LoginState> {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  LoginCubit(this.formKey, this.emailController, this.passwordController)
      : super(LoginInitial());
}

abstract class LoginState {}

class LoginInitial extends LoginState {}
