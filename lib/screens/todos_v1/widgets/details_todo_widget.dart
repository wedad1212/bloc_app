
import 'package:bloc_app/screens/todos_v1/model/todo_detalis.dart';
import 'package:flutter/material.dart';

class DetailsTodoWidget extends StatelessWidget {
  final TodoDetalisModel todoDetalisModel;

  const DetailsTodoWidget({super.key, required this.todoDetalisModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo Details: ${todoDetalisModel.id.toString()}"),
      ),
      body: Padding(
        padding:const EdgeInsets.all(20),
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
           
          children: [
            Text(
              todoDetalisModel.title,
              style: const TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              todoDetalisModel.body,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
