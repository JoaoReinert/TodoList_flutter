import 'package:flutter/material.dart';
import 'package:todo_list_lince/infrastructure/todo_list/webservice/todo_list_webservice.dart';
import 'package:todo_list_lince/global.dart';

import 'infrastructure/todo_list/presentation/todo_list_screen.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TodoListScreen(),
    );
  }
}


