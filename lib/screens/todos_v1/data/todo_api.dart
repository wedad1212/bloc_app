import 'dart:convert';


import 'package:bloc_app/screens/todos_v1/model/todo_detalis.dart';
import 'package:bloc_app/screens/todos_v1/model/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoApi {
  Future<List<TodoModel>> getTodos() async {
    const url = "https://jsonplaceholder.typicode.com/todos";
    try {
      final responce = await http.get(Uri.parse(url));
      List<TodoModel> todos = (json.decode(responce.body))
          .map<TodoModel>((jsonTodo) => TodoModel.formJson(jsonTodo))
          .toList();
      return todos;
    } catch (e) {
      rethrow;
    }
  }

  Future<TodoDetalisModel> getDetailsModel(int id) async {
    String url = "https://jsonplaceholder.typicode.com/posts/$id";
    try {
      final response = await http.get(Uri.parse(url));
      final jsonBody = json.decode(response.body);
      final TodoDetalisModel todoDetalis = TodoDetalisModel.formJson(jsonBody);
    
      return todoDetalis;
    } catch (e) {
      rethrow;
    }
  }
}
