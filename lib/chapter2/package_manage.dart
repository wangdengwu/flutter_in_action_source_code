import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class PackageManage extends StatefulWidget {
  const PackageManage({Key? key}) : super(key: key);

  @override
  _PackageManageState createState() => _PackageManageState();
}

class _PackageManageState extends State<PackageManage> {
  String _wordPair = new WordPair.random().toString();

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
              child: new Text(_wordPair),
            ),
            SizedBox(height: 12),
            ElevatedButton.icon(
              icon: Icon(Icons.new_releases),
              label: Text("获取单词"),
              onPressed: () {
                setState(() {
                  _wordPair = new WordPair.random().toString();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
