part of 'todos_bloc.dart';

abstract class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

class LoadingState extends TodosState {}

class DataTodosState extends TodosState {
  final List<TodoModel> todos;

  const DataTodosState({required this.todos});
  @override
  List<Object> get props => [todos];
}

class ExceptionMessageState extends TodosState {
  final String message;
  const ExceptionMessageState({required this.message});
  @override
  List<Object> get props => [message];
}

class DataTodoDetailsState extends TodosState {
  final TodoDetalisModel todoDetalisModel;


  const DataTodoDetailsState( {required this.todoDetalisModel,});
  @override
  List<Object> get props => [todoDetalisModel];
}
