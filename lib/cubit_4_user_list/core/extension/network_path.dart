// ignore_for_file: constant_identifier_names

enum IServicePath { USER_LIST }

extension IServicePathExtension on IServicePath {
  String get rawValue {
    switch (this) {
      case IServicePath.USER_LIST:
        return "users?page=2";
      default:
        throw Exception("Routes Not Found");
    }
  }
}
