import 'package:flutter/material.dart';

class WillPopScopeWidget extends StatefulWidget {
  @override
  WillPopScopeWidgetState createState() => WillPopScopeWidgetState();
}

class WillPopScopeWidgetState extends State<WillPopScopeWidget> {
  DateTime? _lastPressedAt; //上次点击时间

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("导航返回拦截"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          if (_lastPressedAt == null) {
            //两次点击间隔超过1秒则重新计时
            _lastPressedAt = DateTime.now();
            return false;
          }
          if (_lastPressedAt != null &&
              DateTime.now().difference(_lastPressedAt!) >
                  Duration(seconds: 1)) {
            _lastPressedAt = DateTime.now();
            return false;
          }

          return true;
        },
        child: Center(
          child: Text("1秒内连续按两次返回键返回"),
        ),
      ),
    );
  }
}
