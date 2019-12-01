import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/top_bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset('assets/images/logo_white.png', width: 200),
                  // Padding(padding: EdgeInsets.only(bottom: 4)),
                  Text('by Flutter',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
