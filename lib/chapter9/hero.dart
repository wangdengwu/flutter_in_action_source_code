import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero动画"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(28),
        child: Column(
          children: [
            Hero(
              tag: "hero",
              child: Icon(
                Icons.animation,
                size: 36,
              ),
            ),
            Text("Hero动画"),
          ],
        ),
      ),
    );
  }
}
