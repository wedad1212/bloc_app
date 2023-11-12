import 'package:bloc_app/screens/todos_v1/data/todo_api.dart';
import 'package:bloc_app/screens/todos_v1/model/todo_detalis.dart';
import 'package:bloc_app/screens/todos_v1/model/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_state.dart';
part 'todo_event.dart';
part 'todo_bloc.freezed.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState.lodingState()) {
    on<TodoEvent>((event, emit) async {
      await event.when(getTodoEvent: () async {
        emit(const TodoState.lodingState());

        try {
          final todos = await TodoApi().getTodos();
          emit(TodoState.dataTodosState(todos));
        } catch (e) {
          emit(TodoState.exceptionMessageState(e.toString()));
        }
      }, getTodoDetailsEvent: (todoId) async {
        emit(const TodoState.lodingState());
        try {
          final todoDetalis = await TodoApi().getDetailsModel(todoId);
          emit(TodoState.dataTodoDetailsState(todoDetalis));
        } catch (e) {
          emit(TodoState.exceptionMessageState(e.toString()));
        }
      });
    });
  }
}
