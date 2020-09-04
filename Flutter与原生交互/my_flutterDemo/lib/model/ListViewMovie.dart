import 'package:flutter/material.dart';

class ListViewMovie extends StatelessWidget {
  final List<String> urlItems;
  ListViewMovie({Key key, @required this.urlItems}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('电影海报实例'),
      ),
      body: MyGridViewBuilder(items: urlItems),
    );
  }
}

//GridView builder 动态列表
class MyGridViewBuilder extends StatelessWidget {
  final List<String> items;
  MyGridViewBuilder({Key key, @required this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 2.0,
        crossAxisCount: 3,
        childAspectRatio: 3 / 4,
      ),
      reverse: false,
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int position) {
        return new Image.network(items[position], fit: BoxFit.cover);
      },
    );
  }
}

//GridView count组件
class MyGridView extends StatelessWidget {
  final List<String> items;
  MyGridView({Key key, @required this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 2.0,
        crossAxisCount: 3,
        childAspectRatio: 3 / 4,
      ),
      children: <Widget>[
        new Image.network(items[0], fit: BoxFit.cover),
        new Image.network(items[1], fit: BoxFit.cover),
        new Image.network(items[2], fit: BoxFit.cover),
        new Image.network(items[3], fit: BoxFit.cover),
        new Image.network(items[4], fit: BoxFit.cover),
        new Image.network(items[5], fit: BoxFit.cover),
        new Image.network(items[6], fit: BoxFit.cover),
        new Image.network(items[7], fit: BoxFit.cover),
        new Image.network(items[8], fit: BoxFit.cover),
        new Image.network(items[9], fit: BoxFit.cover),
        new Image.network(items[10], fit: BoxFit.cover),
        new Image.network(items[11], fit: BoxFit.cover),
        new Image.network(items[12], fit: BoxFit.cover),
        new Image.network(items[13], fit: BoxFit.cover),
        new Image.network(items[10], fit: BoxFit.cover),
      ],
    );
  }
}

//GridView count组件
class MyGridViewCount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(10.0),
      crossAxisSpacing: 10.0,
      crossAxisCount: 3,
      children: <Widget>[
        const Text('电影海报实例'),
        const Text('电影海报实例'),
        const Text('电影海报实例'),
        const Text('电影海报实例'),
      ],
    );
  }
}
