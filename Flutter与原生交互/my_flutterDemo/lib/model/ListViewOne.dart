import 'package:flutter/material.dart';

class ListViewOne extends StatefulWidget {
  @override
  createState() => new ListViewOneState();
}

//静态组建
class ListViewOneState extends State {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('简单的图片列表-ListView'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: <Widget>[
          // 非隐藏的菜单
          new IconButton(
              icon: new Icon(Icons.add_alarm),
              tooltip: 'Add Alarm',
              onPressed: () {
                ///路由跳转
              }),
        ],
      ),
      body: MyListView(),
    );
  }
}

List listData = [
  "http://szimg.mukewang.com/5de8adb00809bd4406000338-360-202.jpg",
  "http://szimg.mukewang.com/5b17bad10001535305400300-360-202.jpg",
  "http://szimg.mukewang.com/5e3cfea008e9a61b06000338-360-202.jpg"
];

//静态图列表组件
class MyListView extends StatelessWidget {
  //循环
  List<Widget> _getListData() {
    List<Widget> list = new List();
    for (var i = 0; i < 3; i++) {
      list.add(Container(
        alignment: Alignment.center,
        color: Colors.blue,
        child: new Image.network(listData[i]),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: this._getListData(),
    );
  }
}
