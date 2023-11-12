

import 'package:bloc_app/screens/todos_v1/data/todo_api.dart';
import 'package:bloc_app/screens/todos_v1/model/todo_detalis.dart';
import 'package:bloc_app/screens/todos_v1/model/todo_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodoApi todoApi;
  TodosBloc({required this.todoApi}) : super(LoadingState()) {
    on<TodosEvent>((event, emit) async {
      if (event is GetTodosEvent) {
        emit(LoadingState());
        try {
          final todos = await todoApi.getTodos();
          emit(DataTodosState(todos: todos));
        } catch (e) {
          emit(ExceptionMessageState(message: e.toString()));
        }
      } else if (event is GetTodoDetailsEvent) {
        emit(LoadingState());
        try {
          final todoDetails = await todoApi.getDetailsModel(event.id);
          emit(DataTodoDetailsState(todoDetalisModel: todoDetails,));
        } catch (e) {
          emit(ExceptionMessageState(message: e.toString()));
        }
      }
    });
  }
}
