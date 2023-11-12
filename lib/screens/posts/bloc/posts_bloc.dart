import 'package:bloc_app/screens/posts/data/api_post.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_app/screens/posts/model/post.dart';
import 'package:equatable/equatable.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(const PostsState()) {
    on<PostsEvent>(
      (event, emit) async {
        if (event is GetPostsEvent) {
          if (state.hasReachedMax) return;
          try {
            if (state.status == PostsStatus.loding) {
              List<PostModel> posts = await ApiPost().getPosts();

              posts.isEmpty
                  ? emit(state.copyWith(hasReachedMax: true))
                  : emit(state.copyWith(
                      status: PostsStatus.success,
                      posts: posts,
                      hasReachedMax: false));
            } else {
              List<PostModel> posts =
                  await ApiPost().getPosts(state.posts.length);
              posts.isEmpty
                  ? emit(state.copyWith(hasReachedMax: true))
                  : emit(state.copyWith(
                      hasReachedMax: false,
                      posts: List.of(state.posts)..addAll(posts),
                      status: PostsStatus.success));
            }
          } catch (e) {
            emit(state.copyWith(
                status: PostsStatus.error, message: e.toString()));
          }
        }
      },
      transformer: droppable(),
    );
  }
}
