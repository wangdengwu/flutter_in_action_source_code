import 'package:chinese_idioms/chinese_idioms.dart';
import 'package:flutter/material.dart';

class PackageManage extends StatefulWidget {
  const PackageManage({Key? key}) : super(key: key);

  @override
  _PackageManageState createState() => _PackageManageState();
}

class _PackageManageState extends State<PackageManage> {
  String _wordPair = generateIdioms(top: 1).first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("包管理"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                _wordPair,
                style: TextStyle(fontSize: 48, fontFamily: "pinyin"),
              ),
            ),
            SizedBox(height: 12),
            ElevatedButton.icon(
              icon: Icon(Icons.new_releases),
              label: Text("获取成语"),
              onPressed: () {
                setState(() {
                  _wordPair = generateIdioms().first;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
