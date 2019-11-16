import 'package:flutter/material.dart';

class PostListItem extends StatelessWidget {
  PostListItem({
    Key key,
    this.thumbnail,
    this.title,
    this.subtitle,
    this.publishDate,
  }) : super(key: key);

  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String publishDate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
              child: AspectRatio(
                aspectRatio: 1,
                child: thumbnail,
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: _ArticleDescription(
                title: title,
                subtitle: subtitle,
                publishDate: publishDate,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ArticleDescription extends StatelessWidget {
  _ArticleDescription({
    Key key,
    this.title,
    this.subtitle,
    this.publishDate,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String publishDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Text(
              //   '$publishDate',
              //   style: const TextStyle(
              //     fontSize: 12.0,
              //     // color: Colors.white60,
              //   ),
              // ),
              Text(
                '$subtitle',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  // color: Colors.white60,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                '$title',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '$publishDate',
                style: const TextStyle(
                  fontSize: 12.0,
                  // color: Colors.white60,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
