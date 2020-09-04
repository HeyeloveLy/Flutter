import 'package:flutter/material.dart';

class ListViewTwSimpel extends StatefulWidget {
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
        title: Text('简单的图文列表-ListView'),
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

//图文组件
class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        new ListTile(
          leading: new Icon(Icons.apps),
          title: new Text("ContainerWidget"),
          subtitle: new Text('容器'),
          onTap: () {
            print('容器');
          },
        ),
        new ListTile(
          leading: new Icon(Icons.apps),
          title: new Text("ContainerWidget-1"),
          subtitle: new Text('容器'),
        ),
        new ListTile(
          leading: new Icon(Icons.apps),
          title: new Text("ContainerWidget-2"),
          subtitle: new Text('容器'),
        ),
      ],
    );
  }
}
