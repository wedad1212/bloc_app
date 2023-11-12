import 'package:flutter/material.dart';

class MyLodingWidget extends StatelessWidget {
  const MyLodingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
