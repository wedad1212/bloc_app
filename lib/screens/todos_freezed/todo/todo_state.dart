part of 'todo_bloc.dart';

@freezed
class TodoState with _$TodoState {
  const factory TodoState.lodingState()=_lodingState;
    const factory TodoState.dataTodosState(List<TodoModel> todos)=_dataTodosState;
      const factory TodoState. exceptionMessageState(String message)=_exceptionMessageState;

      const factory TodoState. dataTodoDetailsState(TodoDetalisModel todoDetalisModel)=_dataTodoDetailsState;

}