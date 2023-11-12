import 'package:bloc_app/screens/todos_freezed/screens/details_freezed.dart';
import 'package:bloc_app/screens/todos_freezed/todo/todo_bloc.dart';
import 'package:bloc_app/screens/todos_v1/widgets/my_exception_widget.dart';
import 'package:bloc_app/screens/todos_v1/widgets/my_loading_widget.dart';
import 'package:bloc_app/screens/todos_v1/widgets/my_todos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFreezed extends StatelessWidget {
  const HomeFreezed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Freezed"),
          centerTitle: true,
        ),
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            return state.when(
                lodingState: () => const MyLodingWidget(),
                dataTodosState: (todos) => MyTodoWiget(todos: todos),
                exceptionMessageState: (message) =>
                    MyExceptionWidget(message: message),
                dataTodoDetailsState: (todoDetalisModel) =>const DetailsFreezed());
          },
        ));
  }
}
