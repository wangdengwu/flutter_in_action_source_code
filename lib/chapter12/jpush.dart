import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

class JpushWidget extends StatefulWidget {
  const JpushWidget({Key? key}) : super(key: key);

  @override
  _JpushWidgetState createState() => _JpushWidgetState();
}

class _JpushWidgetState extends State<JpushWidget> {
  String? debugLabel = 'Unknown';
  final JPush jpush = new JPush();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String? platformVersion;

    try {
      jpush.addEventHandler(
          onReceiveNotification: (Map<String, dynamic> message) async {
        print("flutter onReceiveNotification: $message");
        setState(() {
          debugLabel = "flutter onReceiveNotification: $message";
        });
      }, onOpenNotification: (Map<String, dynamic> message) async {
        print("flutter onOpenNotification: $message");
        setState(() {
          debugLabel = "flutter onOpenNotification: $message";
        });
      }, onReceiveMessage: (Map<String, dynamic> message) async {
        print("flutter onReceiveMessage: $message");
        setState(() {
          debugLabel = "flutter onReceiveMessage: $message";
        });
      }, onReceiveNotificationAuthorization:
              (Map<String, dynamic> message) async {
        print("flutter onReceiveNotificationAuthorization: $message");
        setState(() {
          debugLabel = "flutter onReceiveNotificationAuthorization: $message";
        });
      });
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    jpush.setup(
      appKey: "fd45bfc97bc87618c08eb7ab", //你自己应用的 AppKey
      channel: "theChannel",
      production: false,
      debug: true,
    );
    jpush.applyPushAuthority(
        new NotificationSettingsIOS(sound: true, alert: true, badge: true));

    // Platform messages may fail, so we use a try/catch PlatformException.
    jpush.getRegistrationID().then((rid) {
      print("flutter get registration id : $rid");
      setState(() {
        debugLabel = "flutter getRegistrationID: $rid";
      });
    });

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      debugLabel = platformVersion;
    });
  }

  // 编写视图
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('推送'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              color: Colors.brown,
              child: Text(debugLabel ?? "Unknown"),
              width: 350,
              height: 100,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text(" "),
              CustomButton(
                  title: "发本地推送",
                  onPressed: () {
                    // 三秒后出发本地推送
                    var fireDate = DateTime.fromMillisecondsSinceEpoch(
                        DateTime.now().millisecondsSinceEpoch + 3000);
                    var localNotification = LocalNotification(
                        id: 234,
                        title: 'fadsfa',
                        buildId: 1,
                        content: 'fdas',
                        fireTime: fireDate,
                        subtitle: 'fasf',
                        badge: 5,
                        extra: {"fa": "0"});
                    jpush.sendLocalNotification(localNotification).then((res) {
                      setState(() {
                        debugLabel = res;
                      });
                    });
                  }),
              Text(" "),
              CustomButton(
                  title: "getLaunchAppNotification",
                  onPressed: () {
                    jpush.getLaunchAppNotification().then((map) {
                      print("flutter getLaunchAppNotification:$map");
                      setState(() {
                        debugLabel = "getLaunchAppNotification success: $map";
                      });
                    }).catchError((error) {
                      setState(() {
                        debugLabel = "getLaunchAppNotification error: $error";
                      });
                    });
                  }),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(" "),
                CustomButton(
                    title: "clearAllNotifications",
                    onPressed: () {
                      jpush.clearAllNotifications();
                    }),
                Text(" "),
                CustomButton(
                    title: "setBadge",
                    onPressed: () {
                      jpush.setBadge(66).then((map) {
                        setState(() {
                          debugLabel = "setBadge success: $map";
                        });
                      }).catchError((error) {
                        setState(() {
                          debugLabel = "setBadge error: $error";
                        });
                      });
                    }),
                Text(" "),
                CustomButton(
                    title: "cleanBadge",
                    onPressed: () {
                      jpush.setBadge(0).then((map) {
                        setState(() {
                          debugLabel = "setBadge success: $map";
                        });
                      }).catchError((error) {
                        setState(() {
                          debugLabel = "setBadge error: $error";
                        });
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(" "),
                CustomButton(
                    title: "通知授权是否打开",
                    onPressed: () {
                      jpush.isNotificationEnabled().then((bool value) {
                        setState(() {
                          debugLabel = "通知授权是否打开: $value";
                        });
                      }).catchError((onError) {
                        setState(() {
                          debugLabel = "通知授权是否打开: ${onError.toString()}";
                        });
                      });
                    }),
                Text(" "),
                CustomButton(
                    title: "打开系统设置",
                    onPressed: () {
                      jpush.openSettingsForNotification();
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// 封装控件
class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;

  const CustomButton({@required this.onPressed, @required this.title});

  @override
  Widget build(BuildContext context) {
    return new TextButton(
      onPressed: onPressed,
      child: new Text("$title"),
      style: new ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white),
        overlayColor: MaterialStateProperty.all(Color(0xff888888)),
        backgroundColor: MaterialStateProperty.all(Color(0xff585858)),
        padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(10, 5, 10, 5)),
      ),
    );
  }
}
