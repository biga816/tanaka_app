import 'package:flutter/material.dart';

import 'package:tanaka_app/models/post.dart';
import 'package:tanaka_app/utils/date_util.dart';

class BlogHeader extends StatelessWidget {
  final Post post;
  BlogHeader(this.post);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 32, 8, 16),
      child: Column(children: <Widget>[
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              DateUtil.format(post?.date, "yyyy/MM/dd(E) HH:mm", "ja_JP"),
            )),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              post?.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            )),
        Row(
          children: <Widget>[
            for (var tag in post?.tags)
              Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Chip(
                    label: Text(tag.name),
                  )),
          ],
        )
      ]),
    );
  }
}
