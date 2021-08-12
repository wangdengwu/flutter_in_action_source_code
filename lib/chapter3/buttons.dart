import 'package:flutter/material.dart';

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("按钮"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("ElevatedButton"),
              onPressed: () {},
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              child: Text("TextButton"),
              onPressed: () {},
            ),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
              child: Text("OutlinedButton"),
              onPressed: () {},
            ),
            SizedBox(
              height: 20,
            ),
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: () {},
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.send),
              label: Text("ElevatedButton"),
              onPressed: () {},
            ),
            SizedBox(
              height: 20,
            ),
            OutlinedButton.icon(
              icon: Icon(Icons.add),
              label: Text("OutlinedButton"),
              onPressed: () {},
            ),
            SizedBox(
              height: 20,
            ),
            TextButton.icon(
              icon: Icon(Icons.info),
              label: Text("TextButton"),
              onPressed: () {},
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(160, 40)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                overlayColor:
                    MaterialStateProperty.all<Color>(Colors.blue[700]!),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              child: Text("自定义圆角按钮"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
