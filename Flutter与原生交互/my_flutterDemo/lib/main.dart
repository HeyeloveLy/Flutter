import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:my_flutterDemo/model/LayoutDemo.dart';
import 'package:my_flutterDemo/model/AnimationApp.dart';
import 'package:my_flutterDemo/model/HomePage.dart';
import 'package:my_flutterDemo/model/Demo.dart';
import 'package:my_flutterDemo/model/ListViewOne.dart';
import 'package:my_flutterDemo/model/ListViewTwSimpel.dart';
import 'package:my_flutterDemo/model/ListViewHorizontal.dart';
import 'package:my_flutterDemo/model/ListViewDynamic.dart';
import 'package:my_flutterDemo/model/ListViewMovie.dart';
import 'package:my_flutterDemo/pages/tab_navigator.dart';
import 'package:my_flutterDemo/model/AsyncSample.dart';
import 'package:my_flutterDemo/model/BannerSample.dart';
import 'package:my_flutterDemo/model/PaddingSample.dart';
import 'package:my_flutterDemo/model/StackSample.dart';
import 'package:my_flutterDemo/model/MyAppOC.dart';
import 'MyFlutterOC.dart';

void main() {
  runApp(_widgetForRoute(ui.window.defaultRouteName));
}

Widget _widgetForRoute(String route) {
  switch (route) {
    case 'myApp':
      return new MyAppOC();
    case 'home':
      return new MyFlutterOC();
    case 'Unknown':
      return Center(
        child: Text('Unknown route: $route', textDirection: TextDirection.ltr),
      );
    default:
      return new MyApp();
  }
}

//静态组建
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 我们想使用 material 风格的应用，所以这里用 MaterialApp MaterialApp作为根widget，判断是会能响应跳转页面事件的
    return MaterialApp(
      // 移动设备使用这个 title 来表示我们的应用。具体一点说，在 Android 设备里，我们点击
      // recent 按钮打开最近应用列表的时候，显示的就是这个 title。
      title: 'IMouc Flutter Demo',
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  //创建MethodChannel
  // flutter_and_native_101 为通信标识
  // StandardMessageCodec() 为参数传递的 编码方式
  static const methodChannel = const MethodChannel('com.pages.your/native_get');
  _iOSPushToVC3() async {
    await methodChannel.invokeMethod('back', '这是Flutter传给iOS原生的参数back');
  }

  //封装 Flutter 向 原生中 发送消息 的方法
  //method 为方法标识
  //arguments 为参数
  static Future<dynamic> invokNative(String method, {Map arguments}) async {
    if (arguments == null) {
      //无参数发送消息
      return await methodChannel.invokeMethod(method);
    } else {
      //有参数发送消息
      return await methodChannel.invokeMethod(method, arguments);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter组件'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                invokNative("back");
                // _iOSPushToVC3();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: <Widget>[
          // 非隐藏的菜单
          new IconButton(
              icon: new Icon(Icons.add_alarm),
              tooltip: 'Add Alarm',
              onPressed: () {
                ///路由跳转
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return new MyAppOC();
                }));
              }),
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            leading: new Icon(Icons.border_all),
            title: new Text("Text Widget"),
            subtitle: new Text('文本组件'),
            onTap: () {
              // _iOSPushToVC3();
            },
          ),
          new ListTile(
            leading: new Icon(Icons.apps),
            title: new Text("ContainerWidget"),
            subtitle: new Text('容器'),
            onTap: () {
              ///路由跳转
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return new Demo();
              }));
            },
          ),
          new ListTile(
            leading: new Icon(Icons.android),
            title: new Text("Image"),
            subtitle: new Text('照片'),
            onTap: () {
              ///路由跳转
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return new LayoutDemo();
              }));
            },
          ),
          new ListTile(
            leading: new Icon(Icons.ac_unit),
            title: new Text("ListView"),
            subtitle: new Text('简单的图片列表'),
            onTap: () {
              ///路由跳转
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return new ListViewOne();
              }));
            },
          ),
          new ListTile(
              leading: new Icon(Icons.ac_unit),
              title: new Text("ListView"),
              subtitle: new Text('简单的图标列表'),
              onTap: () {
                ///路由跳转
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return new ListViewTwSimpel();
                }));
              }),
          new ListTile(
              leading: new Icon(Icons.ac_unit),
              title: new Text("ListView"),
              subtitle: new Text('横向列表'),
              onTap: () {
                ///路由跳转
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return new ListViewHorizontal();
                }));
              }),
          new ListTile(
              leading: new Icon(Icons.ac_unit),
              title: new Text("ListView"),
              subtitle: new Text('动态列表'),
              onTap: () {
                ///路由跳转
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return new ListViewDynamic(items: titleItems);
                }));
              }),
          new ListTile(
              leading: new Icon(Icons.movie),
              title: new Text("GridView"),
              subtitle: new Text('电影列表'),
              onTap: () {
                ///路由跳转
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return new ListViewMovie(urlItems: urlItems);
                }));
              }),
          new ListTile(
              leading: new Icon(Icons.tab),
              title: new Text("tab_navigator"),
              subtitle: new Text('tab'),
              onTap: () {
                ///路由跳转
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return new TabNavigator();
                }));
              }),
          new ListTile(
              leading: new Icon(Icons.flash_on),
              title: new Text("动画"),
              subtitle: new Text('Animation'),
              onTap: () {
                ///路由跳转
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return new AnimationApp();
                }));
              }),
          new ListTile(
              leading: new Icon(Icons.code),
              title: new Text("绘图"),
              subtitle: new Text('CoreGraphics'),
              onTap: () {}),
          new ListTile(
              leading: new Icon(Icons.timer),
              title: new Text("线程和异步"),
              subtitle: new Text('CoreGraphics'),
              onTap: () {
                ///路由跳转
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return new AsyncSample();
                }));
              }),
          new ListTile(
              leading: new Icon(Icons.important_devices),
              title: new Text("banner"),
              subtitle: new Text('轮播图'),
              onTap: () {
                ///路由跳转
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return new BannerSample();
                }));
              }),
          new ListTile(
              leading: new Icon(Icons.person_add),
              title: new Text("Padding"),
              subtitle: new Text('PaddingSample组件'),
              onTap: () {
                ///路由跳转
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return new PaddingSample();
                }));
              }),
          new ListTile(
              leading: new Icon(Icons.settings_backup_restore),
              title: new Text("Stack"),
              subtitle:
                  new Text('Stack层叠组件 Stack与Align  Stack与Positioned实现定位布局 '),
              onTap: () {
                ///路由跳转
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return new StackSample();
                }));
              }),
        ],
      ),
    );
  }
}

//传参
List<String> titleItems = <String>[
  'keyboard',
  'print',
  'router',
  'pages',
  'zoom_out_map',
  'zoom_out',
  'youtube_searched_for',
  'wifi_tethering',
  'wifi_lock',
  'widgets',
  'weekend',
  'web',
  '图accessible',
  'ac_unit',
];
//电影
List<String> urlItems = <String>[
  'https://img3.doubanio.com/dae/niffler/niffler/images/06f8f6f4-e10b-11ea-b18c-525a79eedfd1.jpg',
  'https://img1.doubanio.com/dae/niffler/niffler/images/5408266a-d858-11ea-b70d-e68a3e56a00c.jpg',
  'https://img1.doubanio.com/dae/niffler/niffler/images/51dd4dba-d575-11ea-aa45-e68a3e56a00c.jpg',
  'https://img3.doubanio.com/dae/niffler/niffler/images/bd70700a-c5a5-11ea-8a59-f23c99dd97de.jpg',
  'https://img1.doubanio.com/dae/niffler/niffler/images/2c714636-c0e3-11ea-be04-ca23268eb119.jpg',
  'https://img3.doubanio.com/dae/niffler/niffler/images/04fcbc08-bb51-11ea-bbd3-6ab7ab463cde.png',
  'https://img1.doubanio.com/dae/niffler/niffler/images/91bc2e6e-b43d-11ea-9a35-d2d7f8baec3a.png',
  'https://img1.doubanio.com/dae/niffler/niffler/images/fbcd1ec2-b112-11ea-909d-d2d7f8baec3a.png',
  'https://img3.doubanio.com/dae/niffler/niffler/images/7b986048-9f1c-11ea-8b53-6e94b03bf1e1.jpg',
  'https://img1.doubanio.com/dae/niffler/niffler/images/ffb879fe-91d3-11ea-ac42-de2223cd0c89.jpg',
  'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2615992304.webp',
  'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2616349755.webp',
  'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2616740389.webp',
  'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2614225081.webp',
];

//与原生交互
class MyAppOC extends StatelessWidget {
  Widget _home(BuildContext context) {
    return new MyOCHomePage(title: 'Flutter Demo Home Page');
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        "/home": (BuildContext context) => new HomePage(),
      },
      home: _home(context),
    );
  }
}
