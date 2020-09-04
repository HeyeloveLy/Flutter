import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyFlutterOC extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyFlutterOC> {
  // 注册一个通知 用于事件流的发送
  static const EventChannel eventChannel =
      const EventChannel('com.pages.your/native_get');
  // 创建一个给native的channel (类似iOS的通知）用于传递方法调用
  static const methodChannel = const MethodChannel('com.pages.your/native_get');
  _iOSPushToVCBack() async {
    await methodChannel.invokeMethod('back', '这是Flutter传给iOS原生的参数');
  }

  // 渲染前的操作，类似viewDidLoad
  @override
  void initState() {
    super.initState();

    // 监听事件，同时发送参数12345
    eventChannel
        .receiveBroadcastStream(12345)
        .listen(_onEvent, onError: _onError);
  }

  String naviTitle = 'title';
  // 回调事件
  void _onEvent(Object event) {
    setState(() {
      naviTitle = event.toString();
    });
  }

  // 错误返回
  void _onError(Object error) {}

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Material(
        child: new Scaffold(
          appBar: AppBar(
            title: Text('Flutter组件'),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    _iOSPushToVCBack();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            backgroundColor: Colors.blue,
            centerTitle: true,
          ),
          body: new Center(
            child: new Text(naviTitle),
          ),
        ),
      ),
    );
  }
}
