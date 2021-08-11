import 'package:flutter/material.dart';

class AssertManage extends StatefulWidget {
  const AssertManage({Key? key}) : super(key: key);

  @override
  _AssertManageState createState() => _AssertManageState();
}

class _AssertManageState extends State<AssertManage> {
  String _homeJson = "";

  void loadHomeJson() async {
    String text = await DefaultAssetBundle.of(context)
        .loadString("asserts/jsons/home.json", cache: true);
    setState(() {
      _homeJson = text;
    });
  }

  @override
  void initState() {
    super.initState();
    loadHomeJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("资源管理"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'asserts/images/avatar.jpeg',
              height: 88,
              width: 88,
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text(_homeJson),
            ),
          ],
        ),
      ),
    );
  }
}
