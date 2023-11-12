import 'package:bloc_app/screens/todos_freezed/todo/todo_bloc.dart';

import 'package:bloc_app/screens/todos_v1/widgets/details_todo_widget.dart';
import 'package:bloc_app/screens/todos_v1/widgets/my_exception_widget.dart';
import 'package:bloc_app/screens/todos_v1/widgets/my_loading_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsFreezed extends StatelessWidget {
  const DetailsFreezed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return state.when(
              lodingState: () => const MyLodingWidget(),
              dataTodosState: (todos) => Container(),
              exceptionMessageState: (message) =>
                  MyExceptionWidget(message: message),
              dataTodoDetailsState: (todoDetalisModel) => DetailsTodoWidget(
                    todoDetalisModel: todoDetalisModel,
                  ));
        },
      ),
    );
  }
}
