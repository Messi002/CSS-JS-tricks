// import 'package:app4/posts/bloc/post_bloc.dart';
// import 'package:app4/posts/widgets/bottom_loader.dart';
// import 'package:app4/posts/widgets/post_list_item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class PostsList extends StatefulWidget {
//   const PostsList({super.key});

//   @override
//   State<PostsList> createState() => _PostsListState();
// }

// class _PostsListState extends State<PostsList> {
//   final ScrollController _scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_onScroll);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<PostBloc, PostState>(
//       builder: (context, state) {
//         switch (state.status) {
//           case PostStatus.failure:
//             return const Center(
//               child: Text('failed to fetch posts'),
//             );

//           case PostStatus.success:
//             if (state.posts.isEmpty) {
//               return const Center(child: Text('no posts'));
//             }
//             return ListView.builder(
//                 controller: _scrollController,
//                 itemCount: state.hasReachedMax
//                     ? state.posts.length
//                     : state.posts.length + 1,
//                 itemBuilder: (context, index) {
//                   return index >= state.posts.length
//                       ? const BottomLoader()
//                       : PostListItem(post: state.posts[index]);
//                 });
//           case PostStatus.initial:
//             return const Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _scrollController
//       ..removeListener(_onScroll)
//       ..dispose();
//   }

//   void _onScroll() {
//     if (_isBottom()) context.read<PostBloc>().add(PostFetched());
//   }

//   bool _isBottom() {
//     if (!_scrollController.hasClients) return false;
//     final maxScroll = _scrollController.position.maxScrollExtent;
//     final currentScroll = _scrollController.offset;
//     return currentScroll >= (maxScroll * 0.9);
//   }
// }
