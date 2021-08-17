import 'package:flutter/material.dart';

class RouteTransitionWidget extends StatelessWidget {
  const RouteTransitionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义路由切换动画"),
      ),
      body: Center(
        child: Text("自定义路由切换动画"),
      ),
    );
  }
}

class FadeRoute extends PageRouteBuilder {
  final Widget child;
  final int durationMs;
  final Curve curve;

  FadeRoute({
    required this.child,
    this.durationMs = 1000,
    this.curve = Curves.fastOutSlowIn,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionDuration: Duration(milliseconds: durationMs),
          transitionsBuilder: (context, a1, a2, child) => RotationTransition(
            turns: Tween(begin: 0.1, end: 1.0).animate(
              CurvedAnimation(
                parent: a1,
                curve: curve,
              ),
            ),
            child: child,
          ),
        );
}
