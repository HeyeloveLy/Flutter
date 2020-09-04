import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  @override
  createState() => new DemoState();
}

//静态组建
class DemoState extends State<Demo> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 我们想使用 material 风格的应用，所以这里用 MaterialApp
    return Scaffold(
      appBar: AppBar(
        title: Text('容器组件示例1'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          //添加容器
          Container(
            margin: EdgeInsets.only(top: 20, left: 120),
            width: 200,
            height: 200,
            //添加边框装饰效果
            decoration: BoxDecoration(
              color: Colors.white,
              //设置上下左右四个边框样式
              border: Border.all(
                //边框颜色
                color: Colors.grey,
                //边框粗细
                width: 8,
              ),
              //边框弧度
              borderRadius: const BorderRadius.all(const Radius.circular(8)),
            ),
            //容器内文字居中
            alignment: Alignment.topLeft,
            //左对齐
            padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
            child: Text(
              'Flutter',
              //textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28),
            ),
          ),
          Container(
            //容器外补白
            margin: EdgeInsets.only(top: 50, left: 120),
            //卡片大小
            constraints: BoxConstraints.tightFor(width: 200, height: 150),
            decoration: BoxDecoration(
              //背景径向渐变
              gradient: RadialGradient(
                colors: [Colors.red, Colors.orange],
                center: Alignment.topLeft,
                radius: .98,
              ),
              //卡片阴影
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4,
                ),
              ],
            ),
            //卡片倾斜变换
            transform: Matrix4.rotationZ(.1),
            //卡片内文字居中
            alignment: Alignment.center,
            //卡片文字
            child: Text(
              '7.20',
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
          new Image.network(
            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1598613517850&di=ea3c5d2f4f89155d9f3d37da31964cb5&imgtype=0&src=http%3A%2F%2Fa1.att.hudong.com%2F60%2F19%2F01300542494512139858192530652_s.jpg',
            //缩放
            scale: 2.0,
            width: 300,
            height: 200,
            fit: BoxFit.cover,
            // color: Colors.lightBlue,
            repeat: ImageRepeat.repeat,
          ),
        ],
      ),
    );
  }
}
