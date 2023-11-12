import 'package:bloc_app/screens/posts/model/post.dart';
import 'package:flutter/material.dart';

class PostItemWidget extends StatelessWidget {
  final PostModel posts;

  const PostItemWidget({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(posts.id.toString()),
      title: Text(
        posts.title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      isThreeLine: true,
      subtitle: Text(
        posts.body,
        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
      ),
    );
  }
}
