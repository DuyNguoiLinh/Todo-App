import 'package:flutter/material.dart';

import '../../data/models/todo.dart';
import '../add_todo/add_todo.dart';
import 'widgets/todo_item.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  static const routeName = '/todo';

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Todo> todos = const [
    Todo(
      title: 'Đi chợ',
      content: 'Mua cá và mua rau',
      isCompleted: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Công việc'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) {
          return TodoItem(
            todo: todos[index],
            onTap: () async {
              final todo = await Navigator.pushNamed(
                context,
                AddTodoPage.routeName,
                arguments: todos[index],
              ) as Todo?;
              if (todo != null) {
                final newTodos = List<Todo>.from(todos);
                newTodos[index] = todo;
                setState(() {
                  todos = newTodos;
                });
              }
            },
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 16,
          );
        },
        itemCount: todos.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final todo = await Navigator.pushNamed(
            context,
            AddTodoPage.routeName,
            arguments: null,
          ) as Todo?;
          if (todo != null) {
            final newTodos = List<Todo>.from(todos);
            newTodos.add(todo);
            setState(() {
              todos = newTodos;
            });
          }
        },
      ),
    );
  }
}

// class TodoModel {
//   TodoModel({
//     required this.id,
//     required this.todo,
//     required this.completed,
//     required this.userId,
//   });
//
//   factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
//         id: json['id'],
//         todo: json['todo'],
//         completed: json['completed'],
//         userId: json['userId'],
//       );
//
//   final int id;
//   final String todo;
//   final bool completed;
//   final int userId;
//
//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'todo': todo,
//         'completed': completed,
//         'userId': userId,
//       };
// }
//
// class TodoResponse {
//   TodoResponse({
//     required this.todos,
//     required this.total,
//     required this.skip,
//     required this.limit,
//   });
//
//   factory TodoResponse.fromJson(Map<String, dynamic> json) => TodoResponse(
//         todos: List<TodoModel>.from(
//           json['todos'].map((x) => TodoModel.fromJson(x)),
//         ),
//         total: json['total'],
//         skip: json['skip'],
//         limit: json['limit'],
//       );
//
//   final List<TodoModel> todos;
//   final int total;
//   final int skip;
//   final int limit;
//
//   Map<String, dynamic> toJson() => {
//         'todos': List<dynamic>.from(todos.map((x) => x.toJson())),
//         'total': total,
//         'skip': skip,
//         'limit': limit,
//       };
// }
