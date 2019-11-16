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
              margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
              color: Colors.black87,
              child: Padding(
                  padding: EdgeInsets.all(8),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        this.text,
                        style: TextStyle(color: Colors.lightGreenAccent),
                      ))))
        ]);
  }
}
