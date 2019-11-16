import 'package:flutter/material.dart';
import 'package:tanaka_app/models/post.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

import './widgets/sorce-code.dart';
import './widgets/blog-header.dart';

class BlogDtailPage extends StatelessWidget {
  final Post post;
  BlogDtailPage(this.post);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${post?.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Image(
                image: NetworkImage(post.media.large),
                fit: BoxFit.cover,
              ),
            ),
            BlogHeader(post),
            Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 64),
                child: Html(
                  useRichText: false,
                  data: '${post?.content}',
                  linkStyle: const TextStyle(
                    color: Colors.cyan,
                  ),
                  onLinkTap: (url) {
                    print(url);
                  },
                  customRender: (node, children) {
                    if (node is dom.Element) {
                      switch (node.localName) {
                        case "pre":
                          return SorceCode(node.text);
                      }
                    }
                  },
                ))
          ],
        ),
      ),
      backgroundColor: Colors.grey[100],
    );
  }
}
