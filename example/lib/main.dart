import 'package:cdnbye_example/global/cdnByeListener.dart';
import 'package:cdnbye_example/pages/videoList.dart';
import 'package:cdnbye_example/pages/videoPage.dart';
import 'package:flutter/material.dart';
import 'package:cdnbye/cdnbye.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // 初始化
    Future.delayed(Duration.zero).then((_) async {
      Cdnbye.init(
        'free',
        config: P2pConfig(
          logLevel: P2pLogLevel.none,
        ),
        infoListener: (Map info) {
          // 写入消息
          CdnByeListener().videoInfo.value = info;
        },
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFf5f5f4),
      ),
      home: VideoList(),
    );
  }
}