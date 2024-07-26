import 'package:flutter/material.dart';
import 'package:fs_practice/ui_screen/username_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const UsernameList(),
      // home: const PageInput(),
    );
  }
}
