import 'package:flutter/material.dart';
import 'package:flutter_application_1/todoForm.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/functions/todocontroller.dart';

class TodoList extends StatelessWidget {
  TodoList({super.key});

  final todoController = Get.find<ToDoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => todoController.todos.isEmpty
              ? const Center(
                  child: Text(
                    'No todos yet. Add some!',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : ListView.builder(
                  itemCount: todoController.todos.length,
                  itemBuilder: (context, index) {
                    final todo = todoController.todos[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: ListTile(
                        title: Text(
                          todo['title'],
                          style: TextStyle(
                            decoration: todo['isCompleted']
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        subtitle: Text(
                          todo['description'],
                          style: TextStyle(
                            decoration: todo['isCompleted']
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        leading: Checkbox(
                          value: todo['isCompleted'],
                          onChanged: (_) => todoController.toggleTodoStatus(index),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            Get.defaultDialog(
                              title: 'Delete Todo',
                              content: const Text('Are you sure you want to delete this todo?'),
                              textConfirm: 'Delete',
                              textCancel: 'Cancel',
                              confirmTextColor: Colors.white,
                              onConfirm: () {
                                todoController.deleteTodo(index);
                                Get.back();
                              },
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const TodoForm()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
