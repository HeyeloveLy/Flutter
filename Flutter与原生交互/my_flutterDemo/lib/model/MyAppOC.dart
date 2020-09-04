import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyOCHomePage extends StatefulWidget {
  MyOCHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyOCHomePageState createState() => new _MyOCHomePageState();
}

class _MyOCHomePageState extends State<MyOCHomePage> {
  // 创建一个给native的channel (类似iOS的通知）
  static const methodChannel = const MethodChannel('com.pages.your/native_get');

  void initState() {
    super.initState();
    _iOSPushToVC2();
  }

  _iOSPushToVC() async {
    await methodChannel.invokeMethod('iOSFlutter', '这是Flutter传给iOS原生的参数');
  }

  _iOSPushToVCBack() async {
    await methodChannel.invokeMethod('back', '这是Flutter传给iOS原生的参数');
  }

  _iOSPushToVC1() async {
    Map<String, dynamic> map = {
      "code": "200",
      "data": [1, 2, 3]
    };
    await methodChannel.invokeMethod('iOSFlutter1', map);
  }

  _iOSPushToVC2() async {
    dynamic result;
    try {
      result = await methodChannel.invokeMethod('iOSFlutter2');
    } on PlatformException {
      result = "error";
    }
    if (result is String) {
      print(result);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return new AlertDialog(
              title: new Text(
                'iOS 传值给 flutter',
                style: new TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                ),
              ),
              content: new Text('$result'),
            );
          });
      // showModalBottomSheet(
      //     context: context,
      //     builder: (BuildContext context) {
      //       return new Container(
      //         child: new Center(
      //           child: new Text(
      //             result,
      //             style: new TextStyle(color: Colors.brown),
      //             textAlign: TextAlign.center,
      //           ),
      //         ),
      //         height: 100.0,
      //       );
      //     });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Flutter组件'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                _iOSPushToVCBack();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new FlatButton(
                onPressed: () {
                  _iOSPushToVC();
                },
                child: new Text("跳转ios新界面，参数是字符串")),
            new FlatButton(
                onPressed: () {
                  _iOSPushToVC1();
                },
                child: new Text("传参，参数是map，看log")),
            new FlatButton(
                onPressed: () {
                  _iOSPushToVC2();
                },
                child: new Text("接收客户端相关内容")),
          ],
        ),
      ),
    );
  }
}
