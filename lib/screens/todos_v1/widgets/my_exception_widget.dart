
import 'package:bloc_app/screens/todos_v1/bloc/todos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyExceptionWidget extends StatelessWidget {
  final String message;

  const MyExceptionWidget({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(message),
        ElevatedButton(
            onPressed: () {
              BlocProvider.of<TodosBloc>(context).add(GetTodosEvent());
            },
            child: const Text("Try Agin"))
      ],
    );
  }
}
