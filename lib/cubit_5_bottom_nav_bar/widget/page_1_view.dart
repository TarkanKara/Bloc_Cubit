import 'package:flutter/material.dart';

class Page1View extends StatelessWidget {
  const Page1View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Page View 1"),
      ),
      body:
          const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Text("Page View 1"),
        )
      ]),
    );
  }
}
