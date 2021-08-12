import 'package:flutter/material.dart';

class WidgetIntro extends StatelessWidget {
  const WidgetIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("子树中获取State对象"),
      ),
      body: Center(
        child: Builder(builder: (context) {
          return ElevatedButton(
            onPressed: () {
              ///推荐使用用法
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("ScaffoldMessenger:我是SnackBar")),
              );

              // 查找父级最近的Scaffold对应的ScaffoldState对象
              // ScaffoldState _state = Scaffold.of(context);
              ///以下代码已废弃
              //调用ScaffoldState的showSnackBar来弹出SnackBar
              // _state.showSnackBar(
              //   SnackBar(
              //     content: Text("ScaffoldState:我是SnackBar"),
              //   ),
              // );
            },
            child: Text("显示SnackBar"),
          );
        }),
      ),
    );
  }
}
