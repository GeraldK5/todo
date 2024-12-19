import 'package:flutter/material.dart';
import 'package:flutter_application_1/todoList.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/functions/todocontroller.dart';

void main() {
  Get.put(ToDoController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TodoList(),
    );
  }
}
