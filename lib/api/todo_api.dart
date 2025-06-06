import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todoapi/data/models/todo.dart';

class TodoApi {
  Future<List<Todo>> getAllTodos() async {
    try {
      const String baseUrl = "https://jsonplaceholder.typicode.com/todos";
      var response = await http.get(Uri.parse(baseUrl));
      List<Todo> todos =
          (json.decode(
            response.body,
          )).map<Todo>((jsonTodo) => Todo.fromJson(jsonTodo)).toList();
      return todos;
    } catch (e) {
      rethrow;
    }
  }
}
