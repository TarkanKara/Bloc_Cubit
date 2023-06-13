import 'package:flutter/material.dart';

import 'cubit_8_user_list/views/user_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
          bodySmall: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1),
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(backgroundColor: Colors.amber)),
        primarySwatch: Colors.purple,
        colorScheme: Theme.of(context)
            .colorScheme
            .copyWith(primary: Colors.purple, secondary: Colors.blueAccent),
      ),
      title: 'Bloc && Cubitt',
      home: const UsersPage(),
    );
  }
}
