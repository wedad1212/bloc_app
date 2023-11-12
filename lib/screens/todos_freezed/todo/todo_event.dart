part of 'todo_bloc.dart';

@freezed
class TodoEvent with _$TodoEvent {
  const factory TodoEvent.getTodoEvent() = _getTodoEvent;
    const factory TodoEvent.getTodoDetailsEvent(int id) = _getTodoDetailsEvent;
}
