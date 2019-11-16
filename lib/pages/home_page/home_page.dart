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
            padding: const EdgeInsets.fromLTRB(0.0, 80.0, .0, 0.0),
            child: Center(
              child: Image.asset(
                'assets/images/logo_white.png',
                // width: MediaQuery.of(context).size.width * 0.4,
                width: 200,
              ),
            ))
      ],
    ));
  }
}
