
import 'package:bloc_app/screens/todos_v1/bloc/todos_bloc.dart';
import 'package:bloc_app/screens/todos_v1/widgets/my_exception_widget.dart';
import 'package:bloc_app/screens/todos_v1/widgets/my_loading_widget.dart';
import 'package:bloc_app/screens/todos_v1/widgets/my_todos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTodos extends StatelessWidget {
  const HomeTodos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo"),
        centerTitle: true,
      ),
      body: BlocBuilder<TodosBloc, TodosState>(builder: (context, state) {
        if (state is DataTodosState) {
          return MyTodoWiget(
  
            todos: state.todos,
          );
        } else if (state is ExceptionMessageState) {
          debugPrint(state.message.toString());
          return MyExceptionWidget(message: state.message);
             
        } else {
          return const MyLodingWidget();
        }
      }),
    );
  }
}
