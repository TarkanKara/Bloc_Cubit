// ignore_for_file: depend_on_referenced_packages, unused_import, unused_element, unused_local_variable

import 'package:bloc_cubit/cubit_2_random/random_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cubit2PageExample extends StatelessWidget {
  const Cubit2PageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NamesCubit>(
      create: (context) => NamesCubit(userList: _userList),
      child: const Cubit2View(),
    );
  }
}

class Cubit2View extends StatelessWidget {
  const Cubit2View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Names Cubit Page"),
      ),
      body: BlocBuilder<NamesCubit, String?>(
        builder: (context, String? nameState) {
          final textButton = SizedBox(
            width: 150,
            height: 50,
            child: TextButton(
                onPressed: () {
                  context.read<NamesCubit>().getRandomName();
                },
                child: Text("Fetch User",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 20))),
          );
          if (nameState != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(nameState,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontSize: 40)),
                  const SizedBox(height: 20),
                  textButton
                ],
              ),
            );
          } else {
            return Center(
              child: textButton,
            );
          }
        },
      ),
    );
  }
}

const Iterable<String> _userList = <String>[
  "Nia",
  "Keenan",
  "Erik",
  "Parker",
  "Jamal",
  "Veronica",
  "Christine",
];
