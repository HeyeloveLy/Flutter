import 'package:flutter/material.dart';

class StackSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stack层叠组件')),
      body: MyStackDemo3(),
    );
  }
}

class StackSampleDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 300,
        color: Colors.red,
        child: Stack(
          // alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              //  left: 10,
              child: Icon(Icons.home, size: 40, color: Colors.white),
            ),
            Positioned(
              bottom: 0,
              left: 100,
              child: Icon(Icons.search, size: 30, color: Colors.white),
            ),
            Positioned(
              right: 0,
              child: Icon(Icons.settings_applications,
                  size: 30, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class MyStackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          Container(
            height: 400,
            width: 300,
            color: Colors.red,
          ),
          Text('我是一个文本', style: TextStyle(fontSize: 40, color: Colors.white))
        ],
      ),
    );
  }
}

class MyStackDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment(1, 0.3),
        children: <Widget>[
          Container(
            height: 400,
            width: 300,
            color: Colors.red,
          ),
          Text('我是一个文本', style: TextStyle(fontSize: 20, color: Colors.white))
        ],
      ),
    );
  }
}

class MyStackDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 300,
        color: Colors.red,
        child: Stack(
          // alignment: Alignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment(1, -0.2),
              child: Icon(Icons.home, size: 40, color: Colors.white),
            ),
            Align(
              alignment: Alignment.center,
              child: Icon(Icons.search, size: 30, color: Colors.white),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(Icons.settings_applications,
                  size: 30, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
