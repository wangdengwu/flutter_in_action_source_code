import 'package:flutter/material.dart';

class AlignmentWidget extends StatelessWidget {
  const AlignmentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("对齐与相对定位（Align）"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            height: 120.0,
            width: 120.0,
            color: Colors.blue[50],
            child: Align(
              alignment: Alignment.topRight,
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),
          Container(
            color: Colors.blue[50],
            child: Align(
              widthFactor: 3,
              heightFactor: 3,
              alignment: Alignment.topRight,
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 120.0,
            width: 120.0,
            color: Colors.blue[50],
            child: Align(
              alignment: FractionalOffset(0.2, 0.6),
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
              child: Text("xxx"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
              widthFactor: 1,
              heightFactor: 1,
              child: Text("xxx"),
            ),
          ),
        ],
      ),
    );
  }
}
