import 'package:flutter/material.dart';

import './pages/blog_page/blog_page.dart';
import './pages/home_page/home_page.dart';
import 'pages/mobx_sample_page/mobx_sample_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: TabHome(),
    theme: new ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.cyan[600],
      accentColor: Colors.cyan[600],
    ),
  ));
}

class TabHome extends StatefulWidget {
  @override
  TabHomeState createState() => TabHomeState();
}

class TabHomeState extends State<TabHome> {
  int _currentIndex = 0;
  List<Widget> _children = [];

  @override
  void initState() {
    super.initState();

    this._children = [HomePage(), BlogPage(), MobxSamplePage()];
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.list),
            title: new Text('Blog'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: new Text('Profile'),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
