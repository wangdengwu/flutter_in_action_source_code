import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_in_action_source_code/iconfont/icon_font.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:oktoast/oktoast.dart';

class JpushWidget extends StatefulWidget {
  const JpushWidget({Key? key}) : super(key: key);

  @override
  _JpushWidgetState createState() => _JpushWidgetState();
}

class _JpushWidgetState extends State<JpushWidget> {
  String? debugLabel = '';
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
      if (rid.isNotEmpty) {
        setState(() {
          debugLabel = "flutter getRegistrationID: $rid";
        });
      }
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            tooltip: "getLaunchAppNotification",
            heroTag: 'launch',
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
            },
            child: Icon(MyIcons.launch),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              heroTag: 'clear_all',
              onPressed: () {
                setState(() {
                  debugLabel = "clearAllNotifications";
                });
                jpush.clearAllNotifications().then((value) {
                  setState(() {
                    debugLabel = "clearAllNotifications success: $value";
                  });
                }).catchError((error) {
                  setState(() {
                    debugLabel = "clearAllNotifications error: $error";
                  });
                });
              },
              child: Icon(MyIcons.clear_all),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              heroTag: 'badge',
              onPressed: () {
                setState(() {
                  debugLabel = "setBadge 66";
                });
                jpush.setBadge(66).then((map) {
                  setState(() {
                    debugLabel = "setBadge success: $map";
                  });
                }).catchError((error) {
                  setState(() {
                    debugLabel = "setBadge error: $error";
                  });
                });
              },
              child: Icon(MyIcons.badge),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              heroTag: 'remove',
              onPressed: () {
                setState(() {
                  debugLabel = "setBadge 0";
                });
                jpush.setBadge(0).then((map) {
                  setState(() {
                    debugLabel = "setBadge success: $map";
                  });
                }).catchError((error) {
                  setState(() {
                    debugLabel = "setBadge error: $error";
                  });
                });
              },
              child: Icon(MyIcons.remove),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              heroTag: 'allow',
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
              },
              child: Icon(MyIcons.allow),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              heroTag: 'system_management',
              onPressed: () {
                jpush.openSettingsForNotification();
              },
              child: Icon(MyIcons.system_management),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("debug信息:"),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(debugLabel ?? "Unknown"),
              width: 350,
              height: 100,
            ),
            NotificationFormSubmit(
              jpush: jpush,
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationFormSubmit extends StatefulWidget {
  const NotificationFormSubmit({Key? key, required this.jpush})
      : super(key: key);

  final JPush jpush;

  @override
  _NotificationFormSubmitState createState() => _NotificationFormSubmitState();
}

class _NotificationFormSubmitState extends State<NotificationFormSubmit> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  bool _switchSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(20.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        border: new Border.all(
          width: 0,
          color: Colors.black12,
        ),
      ),
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              autofocus: true,
              controller: _titleController,
              decoration: InputDecoration(
                labelText: "标题",
                hintText: "消息标题",
                prefixIcon: Icon(Icons.title),
              ),
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              validator: (v) {
                return v != null && v.trim().length > 0 ? null : "消息标题不能为空";
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "内容",
                hintText: "消息内容",
                prefixIcon: Icon(Icons.content_paste),
              ),
              controller: _contentController,
              keyboardType: TextInputType.text,
              //校验密码
              validator: (v) {
                return v != null && v.trim().length > 0 ? null : "消息内容不能为空";
              },
            ),
            Platform.isIOS
                ? SizedBox(
                    width: 220,
                    child: SwitchListTile(
                      value: _switchSelected,
                      onChanged: (value) {
                        setState(() {
                          _switchSelected = value;
                        });
                      },
                      title: Text("是否正式环境"),
                    ),
                  )
                : Text(""),
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Builder(builder: (context) {
                      return ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.all(15.0),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColor),
                          textStyle: MaterialStateProperty.all(TextStyle(
                            color: Colors.white,
                          )),
                        ),
                        child: Text("本地消息"),
                        onPressed: () {
                          bool ok = Form.of(context)?.validate() ?? false;
                          if (ok) {
                            //验证通过提交数据
                            // 1秒后出发本地推送
                            var fireDate = DateTime.fromMillisecondsSinceEpoch(
                                DateTime.now().millisecondsSinceEpoch + 1000);
                            var localNotification = LocalNotification(
                                id: 234,
                                title: _titleController.text,
                                buildId: 1,
                                content: _contentController.text,
                                fireTime: fireDate,
                                // subtitle: 'fasf',
                                badge: 1,
                                extra: {"fa": "0"});
                            widget.jpush
                                .sendLocalNotification(localNotification);
                          }
                        },
                      );
                    }),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Builder(builder: (context) {
                      return ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.all(15.0),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColor),
                          textStyle: MaterialStateProperty.all(TextStyle(
                            color: Colors.white,
                          )),
                        ),
                        child: Text("远程消息"),
                        onPressed: () {
                          bool ok = Form.of(context)?.validate() ?? false;
                          if (ok) {
                            //验证通过提交数据
                            widget.jpush.getRegistrationID().then(
                              (registrationId) async {
                                print(registrationId);
                                if (registrationId.isEmpty) {
                                  showToast("registrationId 为空.");
                                  return;
                                }
                                var dio = new Dio();
                                dio.options.headers = {
                                  "Authorization": "Basic " +
                                      base64Encode(
                                          "fd45bfc97bc87618c08eb7ab:396d869648d24b55aded1654"
                                              .codeUnits),
                                  "Content-Type": " application/json",
                                };
                                try {
                                  var data = {
                                    "platform": ["ios", "android"],
                                    "audience": {
                                      "registration_id": [registrationId],
                                    },
                                    "notification": {
                                      "android": {
                                        "alert": _contentController.text,
                                        "title": _titleController.text,
                                      },
                                      "ios": {
                                        "badge": "+1",
                                        "alert": {
                                          "title": _titleController.text,
                                          "body": _contentController.text,
                                        },
                                      },
                                    },
                                    "options": {
                                      "apns_production": _switchSelected,
                                    }
                                  };
                                  Response resp = await dio.post(
                                    "https://api.jpush.cn/v3/push",
                                    data: data,
                                  );
                                  print(resp.data);
                                } on DioError catch (error) {
                                  print(error.response);
                                }
                              },
                            ).catchError((error) {
                              showToast("getRegistrationID失败: $error");
                            });
                          }
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
