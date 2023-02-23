import 'package:dio/dio.dart';

class ProjectNetworkManager {
  static ProjectNetworkManager? _instance;
  static ProjectNetworkManager get instance {
    _instance ??= ProjectNetworkManager._init();
    return _instance!;
  }

  late final Dio dio;
  final String baseUrll = "https://jsonplaceholder.typicode.com/";

  ProjectNetworkManager._init() {
    dio = Dio(BaseOptions(baseUrl: baseUrll));
  }
}
