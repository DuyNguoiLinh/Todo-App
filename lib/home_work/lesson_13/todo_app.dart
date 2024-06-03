import 'package:flutter/material.dart';

import 'data/models/todo.dart';
import 'pages/add_todo/add_todo.dart';
import 'pages/todo/todo_page.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: TodoPage.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case TodoPage.routeName:
            return MaterialPageRoute(
              builder: (context) {
                return const TodoPage();
              },
              settings: const RouteSettings(
                name: TodoPage.routeName,
              ),
            );
          case AddTodoPage.routeName:
            return MaterialPageRoute(
              builder: (context) {
                return AddTodoPage(
                  todo: settings.arguments as Todo?,
                );
              },
              settings: const RouteSettings(
                name: AddTodoPage.routeName,
              ),
            );
          default:
            return null;
        }
      },
    );
  }
}
