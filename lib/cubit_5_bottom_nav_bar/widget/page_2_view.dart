import 'package:flutter/material.dart';

class Page2View extends StatelessWidget {
  const Page2View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Page View 2"),
      ),
      body:
          const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Text("Page View 2"),
        )
      ]),
    );
  }
}
