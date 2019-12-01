import 'package:flutter/material.dart';

import './widgets/bottom_bar/tab_icon_data.dart';
import './widgets/bottom_bar/bottom_bar.dart';
import './pages/blog_page/blog_page.dart';
import './pages/home_page/home_page.dart';
import './pages//profile//profile_page.dart';
import './pages/work_page/work_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'tanaka no web',
    home: TabHome(),
    theme: new ThemeData(
      // brightness: Brightness.dark,
      backgroundColor: Colors.grey[100],
      primaryColor: Colors.cyan[600],
      accentColor: Colors.cyan[600],
      fontFamily: 'Roboto',
    ),
  ));
}

class TabHome extends StatefulWidget {
  @override
  TabHomeState createState() => TabHomeState();
}

class TabHomeState extends State<TabHome> with TickerProviderStateMixin {
  // int _currentIndex = 0;
  // List<Widget> _children = [];

  AnimationController animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: Colors.white,
  );

  @override
  void initState() {
    // this._children = [HomePage(), BlogPage(), ProfilePage()];

    tabIconsList.forEach((tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    animationController =
        AnimationController(duration: Duration(milliseconds: 600), vsync: this);
    tabBody = HomePage();
    super.initState();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        Expanded(
          child: SizedBox(),
        ),
        BottomBar(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (index) {
            if (index == 0) {
              animationController.reverse().then((data) {
                if (!mounted) return;
                setState(() {
                  tabBody = HomePage();
                });
              });
            } else if (index == 1) {
              animationController.reverse().then((data) {
                if (!mounted) return;
                setState(() {
                  tabBody = BlogPage();
                });
              });
            } else if (index == 2) {
              animationController.reverse().then((data) {
                if (!mounted) return;
                setState(() {
                  tabBody = WorkPage();
                });
              });
            } else if (index == 3) {
              animationController.reverse().then((data) {
                if (!mounted) return;
                setState(() {
                  tabBody = ProfilePage();
                });
              });
            }
          },
        ),
      ],
    );
  }
}
