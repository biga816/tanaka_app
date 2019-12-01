import 'package:flutter/material.dart';

class WorkListItem extends StatelessWidget {
  WorkListItem({
    Key key,
    this.thumbnail,
    this.title,
    this.body,
  }) : super(key: key);

  final Widget thumbnail;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 136,
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
                body: body,
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
    this.body,
  }) : super(key: key);

  final String title;
  final String body;

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
              Text(
                '$title',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                '$body',
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
