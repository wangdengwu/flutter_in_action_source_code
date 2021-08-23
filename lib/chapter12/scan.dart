import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:images_picker/images_picker.dart';
import 'package:scan/scan.dart';

class ScanWidget extends StatefulWidget {
  const ScanWidget({Key? key}) : super(key: key);

  @override
  _ScanWidgetState createState() => _ScanWidgetState();
}

class _ScanWidgetState extends State<ScanWidget> {
  String _platformVersion = 'Unknown';
  ScanController controller = ScanController();
  String qrcode = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await Scan.platformVersion;
    } on PlatformException {
      platformVersion = '获取系统版本失败';
    }
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('扫码'),
      ),
      body: Column(
        children: [
          Text('系统版本: $_platformVersion\n'),
          Wrap(
            children: [
              ElevatedButton(
                child: Text("闪光灯"),
                onPressed: () {
                  controller.toggleTorchMode();
                },
              ),
              ElevatedButton(
                child: Text("暂停"),
                onPressed: () {
                  controller.pause();
                },
              ),
              ElevatedButton(
                child: Text("恢复"),
                onPressed: () {
                  controller.resume();
                },
              ),
              ElevatedButton(
                child: Text("选取二维码图片"),
                onPressed: () async {
                  List<Media>? res = await ImagesPicker.pick();
                  if (res != null) {
                    String? str = await Scan.parse(res[0].path);
                    if (str != null) {
                      setState(() {
                        qrcode = str;
                      });
                    }
                  }
                },
              ),
            ],
          ),
          Container(
            width: 220,
            height: 400,
            child: ScanView(
              controller: controller,
              scanAreaScale: .7,
              scanLineColor: Colors.green.shade400,
              onCapture: (data) {
                setState(() {
                  qrcode = data;
                });
              },
            ),
          ),
          Text('扫码结果：$qrcode'),
        ],
      ),
    );
  }
}
