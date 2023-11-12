import 'package:equatable/equatable.dart';

class TodoDetalisModel extends Equatable {
  final int id;
  final String title;
  final String body;

  const TodoDetalisModel(
      {required this.id, required this.title, required this.body});

  factory TodoDetalisModel.formJson(Map<String, dynamic> json) {
    return TodoDetalisModel(
        id: json["id"], title: json["title"], body: json["body"]);
  }

  @override
  List<Object?> get props => [id, title, body];
}
