import 'package:flutter/material.dart';

//横向列表 ScrollDirection
class ListViewHorizontal extends StatefulWidget {
  @override
  createState() => new ListViewTwSimpelState();
}

//静态组建
class ListViewTwSimpelState extends State {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('横向列表-ScrollDirection'),
          centerTitle: true,
        ),
        body: Center(
          child: Container(height: 200.0, child: MyList()),
        ));
  }
}

//ListView组件
class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      //横向的
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        new Container(width: 180, color: Colors.lightBlue),
        new Container(width: 180, color: Colors.lightBlueAccent),
        new Container(width: 180, color: Colors.lightGreen),
        new Container(width: 180, color: Colors.lightGreenAccent)
      ],
    );
  }
}
