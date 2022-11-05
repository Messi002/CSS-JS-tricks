import 'dart:convert';
import 'dart:async';

import 'package:app4/posts/models/post.dart';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';

part 'post_event.dart';
part 'post_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) =>
    (events, mapper) {
      return droppable<E>().call(events.throttle(duration), mapper);
    };

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({required this.httpClient}) : super(const PostState()) {
    on<PostFetched>(_onPostFetched,
        transformer: throttleDroppable(throttleDuration));
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
      return emit(posts.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: PostStatus.success,
              hasReachedMax: false,
              posts: List.of(state.posts)..addAll(posts)));
    } catch (_) {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }

  final http.Client httpClient;

  Future<List<Post>> _fetchPosts([int startIndex = 0, int postLimit = 20]) async {
    final response = await httpClient.get(
      Uri.https(
        'jsonplaceholder.typicode.com',
        '/posts',
        <String, String>{'_start': '$startIndex', '_limit': '$postLimit'},
      ),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      debugPrint('$body');
      return body.map((dynamic json) {
        final map = json as Map<String, dynamic>;
        return Post(id: map["id"], title: map["title"], body: map["body"]);
      }).toList();
    }
    throw Exception('Error fetching posts');
  }
}
