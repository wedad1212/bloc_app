part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class GetTodosEvent extends TodosEvent {}

class GetTodoDetailsEvent extends TodosEvent {
  final int id;

 const GetTodoDetailsEvent({required this.id});
 @override
  List<Object> get props => [];
}

