import 'package:flutter/material.dart';

class SorceCode extends StatelessWidget {
  final String text;
  SorceCode(this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
              child: Padding(
                  padding: EdgeInsets.all(8),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(this.text))))
        ]);
  }
}
