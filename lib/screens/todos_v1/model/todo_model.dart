import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  final int id;
  final String title;
  final bool complite;

  const TodoModel(
      {required this.id, required this.title, required this.complite});

  factory TodoModel.formJson(Map<String, dynamic> json) {
    return TodoModel(
        id: json["id"], title: json["title"], complite: json["completed"]);
  }
  
  @override
  List<Object?> get props => [id,title,complite];
}
