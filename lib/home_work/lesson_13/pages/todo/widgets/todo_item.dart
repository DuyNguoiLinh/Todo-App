import 'package:flutter/material.dart';

import '../../../data/models/todo.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    required this.todo,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final Todo todo;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.blue,
              width: 1,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                todo.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(todo.content),
            ],
          ),
        ),
      ),
    );
  }
}
