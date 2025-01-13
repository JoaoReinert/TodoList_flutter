import 'package:flutter/material.dart';
import 'package:todo_list_lince/webservice/todo_list_webservice.dart';
import 'package:todo_list_lince/global.dart';

import 'modules/todo_list/screens/todo_list_screen.dart';

void main() async {
  final webService = TodoListWS();
  await initializeState(webService);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const TodoListScreen(),
    );
  }
}
