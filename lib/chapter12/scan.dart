import 'dart:async';

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
      body: Stack(
        children: [
          ScanView(
            controller: controller,
            scanAreaScale: .7,
            scanLineColor: Colors.blue.shade400,
            onCapture: (data) {
              setState(() {
                qrcode = data;
              });
            },
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                '系统版本: $_platformVersion\n',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 30,left: 10,right: 10),
              child: Text(
                '扫码结果：$qrcode',
                style: TextStyle(color: Colors.white),
                // overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'light_mode',
            onPressed: () => controller.toggleTorchMode(),
            child: Icon(Icons.light_mode),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              heroTag: 'pause',
              onPressed: () => controller.pause(),
              child: Icon(Icons.pause),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              heroTag: 'refresh',
              onPressed: () => controller.resume(),
              child: Icon(Icons.refresh),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              heroTag: 'image',
              onPressed: () async {
                List<Media>? res = await ImagesPicker.pick(
                    count: 1, language: Language.Chinese);
                if (res != null) {
                  String? str = await Scan.parse(res[0].path);
                  if (str != null) {
                    setState(() {
                      qrcode = str;
                    });
                  }
                }
              },
              child: Icon(Icons.image),
            ),
          ),
        ],
      ),
    );
  }
}
