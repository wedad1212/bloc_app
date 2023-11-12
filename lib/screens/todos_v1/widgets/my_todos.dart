
import 'package:bloc_app/screens/todos_v1/bloc/todos_bloc.dart';
import 'package:bloc_app/screens/todos_v1/model/todo_model.dart';
import 'package:bloc_app/screens/todos_v1/screens/details_todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyTodoWiget extends StatelessWidget {
  final List<TodoModel> todos;

  const MyTodoWiget({super.key, required this.todos});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView.builder(itemBuilder: ((context, index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const DetailsTodo()));
          BlocProvider.of<TodosBloc>(context)
              .add(GetTodoDetailsEvent(id: todos[index].id));
        },
        child: ListTile(
          leading: CircleAvatar(
            child: Text(todos[index].id.toString()),
          ),
          title: Text(todos[index].title),
          trailing: todos[index].complite
              ? const Icon(
                  Icons.done,
                  color: Colors.green,
                )
              : null,
        ),
      );
    })));
  }
}
