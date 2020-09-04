import 'package:flutter/material.dart';
import 'package:my_flutterDemo/model/HomePage.dart';
import 'package:my_flutterDemo/model/Demo.dart';

class TabNavigator extends StatefulWidget {
  @override
  createState() => new _TabNavigateorState();
}

class _TabNavigateorState extends State<TabNavigator> {
  final _controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    {
      return Scaffold(
        body: PageView(
          controller: _controller,
          children: <Widget>[
            HomePage(),
            Demo(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_location),
            activeIcon: Icon(Icons.my_location),
            title: Text('我的'),
          ),
        ]),
      );
    }
  }
}
