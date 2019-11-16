import 'package:flutter/material.dart';

class WorkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Work'),
        ),
        body: Stack(
          children: <Widget>[
            Container(
                // padding: const EdgeInsets.fromLTRB(0.0, 80.0, .0, 0.0),
                child: Center(child: Text('comming soon...')))
          ],
        ));
  }
}
