import 'package:bloc_cubit/cubit_3_login/model/login_request_model.dart';
import 'package:bloc_cubit/cubit_3_login/model/login_response.dart';
import 'package:dio/dio.dart';

abstract class ILoginService {
  final Dio dio;

  ILoginService(this.dio);

  final String loginPath = ILoginServicePath.LOGIN.rawValue;

  Future<LoginResponseModel?> postUserLogin(LoginRequestModel model);
}

enum ILoginServicePath { LOGIN }

extension ILoginServiceExtension on ILoginServicePath {
  String get rawValue {
    switch (this) {
      case ILoginServicePath.LOGIN:
        return "/login";
    }
  }
}
