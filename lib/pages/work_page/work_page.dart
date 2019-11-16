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
          Container(child: Center(child: Text('comming soon...')))
        ],
      ),
      backgroundColor: Colors.grey[100],
    );
  }
}
