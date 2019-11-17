import 'package:flutter/material.dart';
import './widgets/post_list.dart';
import 'package:tanaka_app/widgets/fixed_body/fixed_body.dart';

class BlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog'),
      ),
      body: FixedBody(
        child: PostList(),
      ),
      backgroundColor: Colors.grey[100],
    );
  }
}
