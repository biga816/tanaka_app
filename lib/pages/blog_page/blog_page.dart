import 'package:flutter/material.dart';
import './widgets/post_list.dart';

class BlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog'),
      ),
      body: PostList(),
    );
  }
}
