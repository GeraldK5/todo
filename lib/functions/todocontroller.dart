import 'package:get/get.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ToDoController extends GetxController {
  final todos = <Map<String, dynamic>>[].obs;
  final String _storageKey = 'todos';
  late SharedPreferences _prefs;

  @override
  void onInit() async {
    super.onInit();
    await initStorage();
  }

  Future<void> initStorage() async {
    _prefs = await SharedPreferences.getInstance();
    loadTodos();
  }

  void loadTodos() {
    final String? storedTodos = _prefs.getString(_storageKey);
    if (storedTodos != null) {
      final List<dynamic> decodedTodos = json.decode(storedTodos);
      todos.value = List<Map<String, dynamic>>.from(decodedTodos);
    }
  }

  Future<void> _saveTodos() async {
    final String encodedTodos = json.encode(todos.toList());
    await _prefs.setString(_storageKey, encodedTodos);
  }

  void addTodo(String title, String description) {
    todos.add({
      'title': title,
      'description': description,
      'isCompleted': false,
    });
    _saveTodos();
  }

  // Toggle todo completion status
  void toggleTodoStatus(int index) {
    todos[index]['isCompleted'] = !todos[index]['isCompleted'];
    todos.refresh();
    _saveTodos();
  }

  // Delete a todo
  void deleteTodo(int index) {
    todos.removeAt(index);
    _saveTodos();
  }

  // Get all todos
  List<Map<String, dynamic>> get allTodos => todos;
}