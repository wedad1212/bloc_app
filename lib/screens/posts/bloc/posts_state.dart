part of 'posts_bloc.dart';

enum PostsStatus { loding, success, error }

class PostsState extends Equatable {
  final PostsStatus status;
  final List<PostModel> posts;
  final bool hasReachedMax;
  final String message;

  const PostsState(
      {this.status = PostsStatus.loding,
      this.posts = const [],
      this.hasReachedMax = false,
      this.message = ""});

  PostsState copyWith({
    PostsStatus? status,
    List<PostModel>? posts,
    bool? hasReachedMax,
    String? message,
  }) {
    return PostsState(
      status: status??this.status,
      posts: posts??this.posts,
      hasReachedMax: hasReachedMax??this.hasReachedMax,
      message: message??this.message
    );
  }

  @override
  List<Object?> get props => [status, posts, hasReachedMax, message];
}
