import 'package:flutter/material.dart';
import 'package:flutter_in_action_source_code/iconfont/icon_font.dart';

class ImageIconWidget extends StatelessWidget {
  const ImageIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("图片及ICON"),
      ),
      body: ImageAndIconRoute(),
    );
  }
}

class ImageAndIconRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var img = AssetImage("asserts/images/avatar.jpeg");
    return SingleChildScrollView(
      child: Column(
          children: [
        ClipOval(
          child: Image.network(
            "https://avatars.githubusercontent.com/u/1317704?s=400&u=69ac492b6bd133104e93ec3cd96c460974fd4ff3&v=4",
            width: 100.0,
          ),
        ),
        Image(
          image: img,
          height: 50.0,
          width: 100.0,
          fit: BoxFit.fill,
          semanticLabel: "fill",
        ),
        Image(
          image: img,
          height: 50,
          width: 50.0,
          fit: BoxFit.contain,
          semanticLabel: "contain",
        ),
        Image(
          image: img,
          width: 100.0,
          height: 50.0,
          fit: BoxFit.cover,
          semanticLabel: "cover",
        ),
        Image(
          image: img,
          width: 100.0,
          height: 50.0,
          fit: BoxFit.fitWidth,
          semanticLabel: "fitWidth",
        ),
        Image(
          image: img,
          width: 100.0,
          height: 50.0,
          fit: BoxFit.fitHeight,
          semanticLabel: "fitHeight",
        ),
        Image(
          image: img,
          width: 100.0,
          height: 50.0,
          fit: BoxFit.scaleDown,
          semanticLabel: "scaleDown",
        ),
        Image(
          image: img,
          height: 50.0,
          width: 100.0,
          fit: BoxFit.none,
          semanticLabel: "none",
        ),
        Image(
          image: img,
          width: 100.0,
          color: Colors.blue,
          colorBlendMode: BlendMode.difference,
          fit: BoxFit.fill,
          semanticLabel: "fill",
        ),
        Image(
          image: img,
          width: 100.0,
          height: 200.0,
          repeat: ImageRepeat.repeatY,
          semanticLabel: "repeatY",
        ),
      ].map((item) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                width: 100,
                child: item,
              ),
            ),
            Text((item is Image) ? item.semanticLabel.toString() : "网络加载"),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  MyIcons.zhifubao,
                  color: Colors.blue,
                  size: 20,
                ),
                Icon(
                  MyIcons.zuanshizhanweizi,
                  color: Colors.blue,
                  size: 20,
                )
              ],
            ),
          ],
        );
      }).toList()),
    );
  }
}
