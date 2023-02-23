import 'package:bloc_cubit/cubit_6_cagdas_vbt/core/network/network_manager.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ApplicationProvider {
  final List<SingleChildWidget> items = [
    Provider<Dio>(
      create: (context) => ProjectNetworkManager.instance.dio,
    )
  ];
}
