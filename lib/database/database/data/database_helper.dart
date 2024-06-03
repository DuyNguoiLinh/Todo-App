import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../data/models/todo.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static const _databaseName = 'todos_demo.db';
  static const _databaseVersion = 1;

  static const tableName = 'todos';

  static const columnId = 'id';
  static const columnTitle = 'title';
  static const columnContent = 'content';
  static const columnIsCompleted = 'isCompleted';
  static const columnCreatedDate = 'createdDate';
  static const columnUpdatedDate = 'updatedDate';
  static final DatabaseHelper instance = DatabaseHelper._();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDatabase();
      return _database!;
    }
  }

  Future<Database> _initDatabase() async {
    final path = await getDatabasesPath();
    return openDatabase(
      join(path, _databaseName),
      onCreate: _onCreate,
      version: _databaseVersion,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
      '''
         CREATE TABLE $tableName (
           $columnId INTEGER PRIMARY KEY AUTOINCREMENT, 
           $columnTitle TEXT NOT NULL,
           $columnContent TEXT NOT NULL,
           $columnIsCompleted INTEGER NOT NULL, 
           $columnCreatedDate TEXT NOT NULL,
           $columnUpdatedDate TEXT NOT NULL
         )
      ''',
    );
  }

  Future<void> initDB() async {}

  Future<int> insertTodo(Todo todo) async {
    final result = await (await database).insert(tableName, todo.toMap());
    return result;
  }

  Future<int> updateTodo(Todo todo) async {
    final result = await (await database).update(
      tableName,
      todo.toMap(),
      where: '$columnId = ?',
      whereArgs: [todo.id],
    );
    return result;
  }

  Future<List<Todo>> getTodos() async {
    final queryResult = await (await database).query(tableName);
    return queryResult.map((e) => Todo.fromMap(e)).toList();
  }

  Future<void> deleteTodo(int id) async {
    await (await database).delete(
      tableName,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}
