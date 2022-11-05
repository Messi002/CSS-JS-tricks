import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import 'package:app4/posts/models/post.dart';
import 'package:equatable/equatable.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({required this.httpClient}) : super(const PostState()) {
    on<PostFetched>(_onPostFetched);
  }

  Future<void> _onPostFetched(
      PostFetched event, Emitter<PostState> emit) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == PostStatus.initial) {
        final posts = await _fetchPosts();
        return emit(state.copyWith(
            status: PostStatus.success, hasReachedMax: false, posts: posts));
      }

      final posts = await _fetchPosts(state.posts.length);
      return emit();
    } catch (e) {}
  }

  final http.Client httpClient;
}
