import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerSample extends StatefulWidget {
  @override
  createState() => new _BannerSampleState();
}

List _imageUrls = [
  "http://szimg.mukewang.com/5de8adb00809bd4406000338-360-202.jpg",
  "http://szimg.mukewang.com/5b17bad10001535305400300-360-202.jpg",
  "http://szimg.mukewang.com/5e3cfea008e9a61b06000338-360-202.jpg"
];

//静态组建
class _BannerSampleState extends State {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('轮播图'),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              MyBanner(),
            ],
          ),
        ));
  }
}

//轮播组件
class MyBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: Swiper(
        itemCount: _imageUrls.length,
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            _imageUrls[index],
            fit: BoxFit.fill,
          );
        },
        pagination: SwiperPagination(),
      ),
    );
  }
}
