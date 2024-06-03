import 'package:flutter/material.dart';

import '../../data/database_helper.dart';
import '../../data/models/todo.dart';
import '../add_todo/add_todo_page.dart';
import 'widgets/todo_item.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  static const routeName = '/todo';

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Todo>? todos;

  @override
  void initState() {
    super.initState();
    getTodos();
  }

  Future<void> getTodos() async {
    final todos = await DatabaseHelper.instance.getTodos();
    setState(() {
      this.todos = todos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Công việc'),
      ),
      body: _buildTodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _onCreate,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTodoList() {
    if (todos == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (todos?.isEmpty ?? true) {
      return const Center(
        child: Text('Không có công việc nào'),
      );
    } else {
      return ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) {
          return TodoItem(
            todo: todos![index],
            onTap: () async {
              await _onUpdate(index: index);
            },
            onDelete: () async {
              await _onDelete(index: index);
            },
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 16,
          );
        },
        itemCount: todos?.length ?? 0,
      );
    }
  }

  Future<void> _onUpdate({
    required int index,
  }) async {
    final todo = await Navigator.pushNamed(
      context,
      AddTodoPage.routeName,
      arguments: todos![index],
    ) as Todo?;
    if (todo != null) {
      final newTodos = List<Todo>.from(todos!);
      newTodos[index] = todo;
      setState(() {
        todos = newTodos;
      });
    }
  }

  Future<void> _onCreate() async {
    final todo = await Navigator.pushNamed(
      context,
      AddTodoPage.routeName,
      arguments: null,
    ) as Todo?;
    if (todo != null) {
      final newTodos = List<Todo>.from(todos!);
      newTodos.add(todo);
      setState(() {
        todos = newTodos;
      });
    }
  }

  Future<void> _onDelete({
    required int index,
  }) async {
    final newTodos = List<Todo>.from(todos!);
    newTodos.removeAt(index);
    setState(() {
      todos = newTodos;
    });
  }
}
