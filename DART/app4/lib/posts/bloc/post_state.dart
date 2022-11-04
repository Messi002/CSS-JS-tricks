// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'post_bloc.dart';

enum PostStatus { initial, success, failure }

@immutable
 class PostState extends Equatable {
  final PostStatus status;
  final List<Post> posts;
  final bool hasReachedMax;
  const PostState({
    this.status = PostStatus.initial,
    this.posts = const <Post>[],
    this.hasReachedMax = false,
  });

  PostState copyWith(
      {List<Post>? posts, PostStatus? status, bool? hasReachedMax}) {
    return PostState(
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        posts: posts ?? this.posts,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [status, posts, hasReachedMax];

  @override
  
}

class PostInitial extends PostState {}
