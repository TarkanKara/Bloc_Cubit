import 'package:flutter/material.dart';

class Cubit1PageExample extends StatefulWidget {
  const Cubit1PageExample({super.key});

  @override
  State<Cubit1PageExample> createState() => _Cubit1PageExampleState();
}

class _Cubit1PageExampleState extends State<Cubit1PageExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit Example_1"),
      ),
      body: Center(
          child: TextButton(onPressed: () {}, child: const Text("Cubit"))),
    );
  }
}
