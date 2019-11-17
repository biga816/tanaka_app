import 'package:flutter/material.dart';

class FixedBody extends StatelessWidget {
  FixedBody({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: 992),
        child: child,
      ),
    );
  }
}
