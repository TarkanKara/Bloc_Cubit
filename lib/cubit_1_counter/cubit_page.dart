// ignore_for_file: depend_on_referenced_packages

import 'package:bloc_cubit/cubit_1_counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cubit1PageExample extends StatefulWidget {
  const Cubit1PageExample({super.key});

  @override
  State<Cubit1PageExample> createState() => _Cubit1PageExampleState();
}

class _Cubit1PageExampleState extends State<Cubit1PageExample> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: const Cubit1PageView(),
    );
  }
}

class Cubit1PageView extends StatelessWidget {
  const Cubit1PageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit Counter"),
      ),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, appstate) {
          return Center(
            child: Center(
                child: Text(appstate.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 35))),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
              onPressed: () {
                context.read<CounterCubit>().increment();
              },
              child: const Text("Inc", style: TextStyle(fontSize: 20))),
          TextButton(
              onPressed: () {
                context.read<CounterCubit>().decrement();
              },
              child: const Text("Dec", style: TextStyle(fontSize: 20)))
        ],
      ),
    );
  }
}
