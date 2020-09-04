// ListViewDynamic 动态列表 List 使用 传递 接受 实现动态列表
import 'package:flutter/material.dart';

class ListViewDynamic extends StatelessWidget {
  final List<String> items;
  ListViewDynamic({Key key, @required this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('动态列表-ScrollDirection'),
          centerTitle: true,
        ),
        body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return new ListTile(
              title: new Text('${items[index]}'),
            );
          },
        ));
  }
}
