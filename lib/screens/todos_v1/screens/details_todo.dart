
import 'package:bloc_app/screens/todos_v1/bloc/todos_bloc.dart';
import 'package:bloc_app/screens/todos_v1/widgets/details_todo_widget.dart';
import 'package:bloc_app/screens/todos_v1/widgets/my_exception_widget.dart';
import 'package:bloc_app/screens/todos_v1/widgets/my_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsTodo extends StatelessWidget {
  const DetailsTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<TodosBloc, TodosState>(builder: (context, state) {
      if (state is DataTodoDetailsState) {
        return DetailsTodoWidget(
          todoDetalisModel: state.todoDetalisModel,
        );
      } else if (state is ExceptionMessageState) {
        return MyExceptionWidget(message: state.message);
      } else {
        return const MyLodingWidget();
      }
    }));
  }
}
