import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/provider/todo_provider.dart';

class AddTodo extends ConsumerWidget {
  AddTodo({super.key});

  final TextEditingController todoController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Todo App',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: todoController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          TextButton(
              onPressed: () {
                ref.read(todoProvider.notifier).addTodo(todoController.text);
                Navigator.pop(context);
              },
              child: const Text('Add Todo'))
        ],
      )),
    );
  }
}
