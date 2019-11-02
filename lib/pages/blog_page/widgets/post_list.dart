import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:tanaka_app/stores/posts/posts_store.dart';
import 'package:tanaka_app/models/post.dart';
import 'package:tanaka_app/utils/date_util.dart';
import './post_list_item.dart';
import './list_spinner.dart';

final post = PostsStore();

class PostList extends StatefulWidget {
  @override
  PostListState createState() => PostListState();
}

class PostListState extends State<PostList> {
  ScrollController controller;
  List<Function> disposers = [];
  bool isEnableLoading = true;
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    controller = new ScrollController();

    // fetch all posts
    if (post.page == 1) {
      post.fetchPosts(post.page);
    }

    // observe store
    disposers.add(post.posts.observe((list) {
      isEnableLoading = true;
      posts = list.object.toList();
    }));
  }

  @override
  void dispose() {
    disposers.forEach((disposer) => disposer());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
        onNotification: _handleScrollNotification,
        child: Observer(builder: (_) {
          return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              controller: controller,
              itemBuilder: (context, i) {
                if (i < post.posts.length * 2) {
                  // item
                  if (i.isOdd) return Divider();
                  final index = i ~/ 2;
                  return _buildRow(post.posts[index]);
                } else {
                  // loading
                  return Observer(
                      builder: (_) => ListSpinner(loading: post.loading));
                }
              },
              itemCount: post.posts.length * 2 + 1);
        }));
  }

  Widget _buildRow(Post post) {
    return PostListItem(
      thumbnail:
          Image(image: NetworkImage(post.media.medium), fit: BoxFit.cover),
      title: post.title,
      subtitle: post.tags.map((tag) => tag.name).join(", "),
      publishDate: DateUtil.format(post.date, "yyyy/MM/dd(E) HH:mm", "ja_JP"),
    );
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      if (controller.position.extentAfter == 0 && isEnableLoading) {
        isEnableLoading = false;
        post.fetchPosts(post.page + 1);
      }
    }
    return false;
  }
}
