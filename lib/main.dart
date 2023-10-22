
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/view_models/app_view_model.dart';
import 'package:to_do_list/views/task_page.dart';

void main() {
  runApp(ChangeNotifierProvider( create: (context) => AppViewModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskPage(),
    );
  }
}

