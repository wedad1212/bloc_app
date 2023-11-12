import 'package:bloc_app/screens/posts/bloc/posts_bloc.dart';
import 'package:bloc_app/screens/posts/widgets/post_item_widget.dart';
import 'package:bloc_app/screens/todos_v1/widgets/my_loading_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePosts extends StatefulWidget {
  const HomePosts({super.key});

  @override
  State<HomePosts> createState() => _HomePostsState();
}

class _HomePostsState extends State<HomePosts> {
  final _myScrollController = ScrollController();
  @override
  void initState() {
    _myScrollController.addListener((_onScroll));
    super.initState();
  }

  @override
  void dispose() {
    _myScrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _myScrollController.position.maxScrollExtent;
    final currentScrollUser = _myScrollController.offset;
    if (currentScrollUser >= (maxScroll * 0.8)) {
      context.read<PostsBloc>().add(GetPostsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state.posts.isEmpty) return const Center();
          switch (state.status) {
            case PostsStatus.loding:
              return const MyLodingWidget();

            case PostsStatus.success:
              return Padding(
                padding: const EdgeInsets.all(15),
                child: ListView.builder(
                    controller: _myScrollController,
                    itemCount: state.hasReachedMax
                        ? state.posts.length
                        : state.posts.length + 1,
                    itemBuilder: ((context, index) =>
                        index >= state.posts.length
                            ? const MyLodingWidget()
                            : PostItemWidget(posts: state.posts[index]))),
              );
            case PostsStatus.error:
              return Center(
                child: Text(state.message),
              );
          }
        },
      ),
    );
  }
}
