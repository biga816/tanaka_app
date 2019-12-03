import 'package:flutter/material.dart';
import 'package:tanaka_app/models/post.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:universal_html/prefer_universal/html.dart' as html;

import 'package:tanaka_app/widgets/fixed_body/fixed_body.dart';
import './widgets/sorce-code.dart';
import './widgets/blog-header.dart';

class BlogDtailPage extends StatelessWidget {
  final Post post;
  BlogDtailPage(this.post);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 240,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(post.media.large),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                FixedBody(
                  child: Column(children: <Widget>[
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
                            html.window.open(url, '_blank');
                          },
                          customRender: (node, children) {
                            if (node is dom.Element) {
                              switch (node.localName) {
                                case "pre":
                                  return SorceCode(node.text);
                                case "img":
                                  return Center(
                                      child: Html(data: node.outerHtml));
                              }
                            }
                          },
                        ))
                  ]),
                )
              ],
            ),
          ),
          Positioned(
            // --> App Bar
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  leading: Padding(
                    // --> Custom Back Button
                    padding: const EdgeInsets.all(4.0),
                    child: FloatingActionButton(
                      elevation: 2.0,
                      backgroundColor: Colors.white,
                      mini: true,
                      onPressed: () => Navigator.of(context).pop(),
                      child: Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[100],
    );
  }
}
