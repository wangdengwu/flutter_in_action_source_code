import 'package:flutter/material.dart';

class AnimationStructureWidget extends StatefulWidget {
  const AnimationStructureWidget({Key? key}) : super(key: key);

  @override
  _AnimationStructureWidgetState createState() =>
      _AnimationStructureWidgetState();
}

class _AnimationStructureWidgetState extends State<AnimationStructureWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //使用弹性曲线
    // animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    //图片宽高从0变到300
    animation = new Tween(begin: 30.0, end: 300.0).animate(controller);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });
    //启动动画(正向执行)
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画基本结构及状态监听"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          child: Image.asset(
            "asserts/images/avatar.jpeg",
          ),
          builder: (context, child) {
            return Container(
              width: animation.value,
              height: animation.value,
              child: child,
            );
          },
        ),
      ),
    );
  }
}
