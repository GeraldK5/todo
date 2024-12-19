import 'package:flutter/material.dart';
import 'package:flutter_application_1/functions/todocontroller.dart';
import 'package:flutter_application_1/todoList.dart';
import 'package:get/get.dart';

class TodoForm extends StatefulWidget {
  const TodoForm({super.key});

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final todoController = Get.find<ToDoController>();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Add todo to the controller
      todoController.addTodo(
        _titleController.text,
        _descriptionController.text,
      );

      // Clear the form
      _titleController.clear();
      _descriptionController.clear();

      // Show success message and navigate back
      Get.snackbar(
        'Success',
        'Todo added successfully',
        snackPosition: SnackPosition.BOTTOM,
      );

      Navigator.push(context, MaterialPageRoute(builder:(context) => TodoList(),));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Todo")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(20))),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(20))),
                    alignLabelWithHint: true,
                  ),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    minimumSize: const Size(double.infinity, 48), // Makes button full width
  ),
                  child: const Text('Add Todo'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}