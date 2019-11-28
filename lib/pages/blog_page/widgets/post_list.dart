import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:tanaka_app/pages/blog_detail_page/blog_detail_page.dart';
import 'package:tanaka_app/stores/posts/posts_store.dart';
import 'package:tanaka_app/models/post.dart';
import 'package:tanaka_app/utils/date_util.dart';
import 'package:tanaka_app/widgets/list_spinner/list_spinner.dart';
import './post_list_item.dart';

final post = PostsStore();

class PostList extends StatefulWidget {
  @override
  PostListState createState() => PostListState();
}

class PostListState extends State<PostList> with TickerProviderStateMixin {
  AnimationController animationController;
  ScrollController controller;
  List<Function> disposers = [];
  bool isEnableLoading = true;
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    controller = new ScrollController();
    animationController =
        AnimationController(duration: Duration(milliseconds: 600), vsync: this);

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
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
        onNotification: _handleScrollNotification,
        child: Observer(builder: (_) {
          return ListView.builder(
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 90),
              controller: controller,
              itemBuilder: (context, i) {
                if (i < post.posts.length) {
                  // item
                  // if (i.isOdd) return Divider();
                  // final index = i ~/ 2;
                  animationController.forward();
                  return _buildRow(
                    post.posts[i],
                    Tween(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: this.animationController,
                        curve: Interval((1 - 1 / (i + 1)) * 1, 1.0,
                            curve: Curves.fastOutSlowIn),
                      ),
                    ),
                  );
                } else {
                  // loading
                  return Observer(
                    builder: (_) => Padding(
                      padding: EdgeInsets.only(bottom: 58),
                      child: ListSpinner(loading: post.loading),
                    ),
                  );
                }
              },
              itemCount: post.posts.length + 1);
        }));
  }

  Widget _buildRow(Post post, Animation animation) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return FadeTransition(
            opacity: animation,
            child: new Transform(
              transform: new Matrix4.translationValues(
                  0.0, 30 * (1.0 - animation.value), 0.0),
              child: Card(
                elevation: 4,
                margin: EdgeInsets.all(6),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: InkWell(
                    child: PostListItem(
                      thumbnail: Image(
                          image: NetworkImage(post.media.medium),
                          fit: BoxFit.cover),
                      title: post.title,
                      subtitle: post.tags.map((tag) => tag.name).join(", "),
                      publishDate: DateUtil.format(
                          post.date, "yyyy/MM/dd(E) HH:mm", "ja_JP"),
                    ),
                    onTap: () => goToDetail(post)),
              ),
            ),
          );
        });
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

  void goToDetail(Post post) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BlogDtailPage(post)),
    );
  }
}
