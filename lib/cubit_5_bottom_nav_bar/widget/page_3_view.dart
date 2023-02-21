import 'package:flutter/material.dart';

class Page3View extends StatelessWidget {
  const Page3View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Page View 3"),
      ),
      body:
          const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Text("Page View 3"),
        )
      ]),
    );
  }
}
