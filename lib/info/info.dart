import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_in_action_source_code/iconfont/icon_font.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  PackageInfo? _packageInfo;

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  Widget _infoTile(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle.isEmpty ? 'Not set' : subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    int year = DateTime.now().year;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Column(
              children: [
                ClipRRect(
                  child: Image.asset(
                    "asserts/images/avatar.jpeg",
                    width: 60,
                    height: 60,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 26, 0, 10),
                  child: Text(
                    _packageInfo == null ? "" : _packageInfo!.appName,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ),
                Text(
                  "Version ${_packageInfo?.version}",
                  style: TextStyle(fontSize: 13),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: () async {
                        final url =
                            "https://gitee.com/wangdengwu/flutter_in_action_source_code";
                        if (await canLaunch(url)) {
                          await launch(url);
                        }
                      },
                      icon: Icon(MyIcons.gitee),
                      label: Text("代码地址"),
                    ),
                    TextButton.icon(
                      onPressed: () async {
                        final url =
                            "https://github.com/wangdengwu/flutter_in_action_source_code";
                        if (await canLaunch(url)) {
                          await launch(url);
                        }
                      },
                      icon: Icon(MyIcons.github),
                      label: Text("代码地址"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListView(
            padding: EdgeInsets.only(left: 30, right: 30),
            shrinkWrap: true,
            // semanticChildCount: 1,
            children: [
              Divider(color: Colors.black12),
              ListTile(
                title: Text("去评分"),
                trailing: Icon(Icons.chevron_right),
              ),
              Divider(color: Colors.black12),
              ListTile(
                title: Text("功能介绍"),
                trailing: Icon(Icons.chevron_right),
              ),
              Divider(color: Colors.black12),
              ListTile(
                title: Text("投诉"),
                trailing: Icon(Icons.chevron_right),
              ),
              Divider(color: Colors.black12),
              ListTile(
                title: Text("版本更新"),
                trailing: Icon(Icons.chevron_right),
              ),
              Divider(color: Colors.black12),
            ],
          ),
          // Expanded(
          //   child:
          // ),
          Column(
            children: [
              Text(
                "xxx 版权所有",
                style: TextStyle(color: Colors.black26, fontSize: 10),
              ),
              Text(
                "Copyright @ 2013-$year xxx. All Rights Reserved.",
                style: TextStyle(color: Colors.black26, fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
