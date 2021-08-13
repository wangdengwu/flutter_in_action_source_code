import 'package:flutter/material.dart';

class AssertManage extends StatefulWidget {
  const AssertManage({Key? key}) : super(key: key);

  @override
  _AssertManageState createState() => _AssertManageState();
}

class _AssertManageState extends State<AssertManage> {
  String _text = "";

  void loadHomeJson() async {
    String text =
        await DefaultAssetBundle.of(context).loadString("LICENSE", cache: true);
    setState(() {
      _text = text;
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Image.asset(
              'asserts/images/avatar.jpeg',
              height: 88,
              width: 88,
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_text),
            ),
          ],
        ),
      ),
    );
  }
}
