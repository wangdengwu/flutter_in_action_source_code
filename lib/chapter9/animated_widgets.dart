import 'package:flutter/material.dart';

class AnimatedWidgets extends StatefulWidget {
  const AnimatedWidgets({Key? key}) : super(key: key);

  @override
  _AnimatedWidgetsState createState() => _AnimatedWidgetsState();
}

class _AnimatedWidgetsState extends State<AnimatedWidgets> {
  Color _decorationColor = Colors.red;

  double _padding = 10;
  var _align = Alignment.topRight;
  double _height = 100;
  double _left = 0;
  Color _color = Colors.red;
  TextStyle _style = TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    var duration = Duration(seconds: 5);

    return Scaffold(
      appBar: AppBar(
        title: Text("动画过渡组件"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDecoratedBox(
              duration: duration,
              decoration: BoxDecoration(color: _decorationColor),
              child: Builder(
                builder: (context) {
                  return TextButton(
                    onPressed: () {
                      setState(() {
                        _decorationColor = _decorationColor == Colors.blue
                            ? Colors.red
                            : Colors.blue;
                      });
                    },
                    child: Text(
                      "AnimatedDecoratedBox toggle",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _padding = _padding == 10 ? 20 : 10;
                });
              },
              child: AnimatedPadding(
                duration: duration,
                padding: EdgeInsets.all(_padding),
                child: Text("AnimatedPadding"),
              ),
            ),
            SizedBox(
              height: 50,
              child: Stack(
                children: <Widget>[
                  AnimatedPositioned(
                    duration: duration,
                    left: _left,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _left = _left == 0 ? 100 : 0;
                        });
                      },
                      child: Text("AnimatedPositioned"),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 100,
              color: Colors.grey,
              child: AnimatedAlign(
                duration: duration,
                alignment: _align,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _align = _align == Alignment.topRight
                          ? Alignment.center
                          : Alignment.topRight;
                    });
                  },
                  child: Text("AnimatedAlign"),
                ),
              ),
            ),
            AnimatedContainer(
              duration: duration,
              height: _height,
              color: _color,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _height = _height == 100 ? 150 : 100;
                    _color = _color == Colors.red ? Colors.blue : Colors.red;
                  });
                },
                child: Text(
                  "AnimatedContainer",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            AnimatedDefaultTextStyle(
              child: GestureDetector(
                child: Text("hello world"),
                onTap: () {
                  setState(() {
                    _style = TextStyle(
                      color: Colors.blue,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationColor: Colors.blue,
                    );
                  });
                },
              ),
              style: _style,
              duration: duration,
            ),
          ].map((e) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: e,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class AnimatedDecoratedBox extends ImplicitlyAnimatedWidget {
  AnimatedDecoratedBox({
    Key? key,
    required this.decoration,
    required this.child,
    Curve curve = Curves.linear, //动画曲线
    required Duration duration, // 正向动画执行时长
  }) : super(
          key: key,
          curve: curve,
          duration: duration,
        );
  final BoxDecoration decoration;
  final Widget child;

  @override
  _AnimatedDecoratedBoxState createState() {
    return _AnimatedDecoratedBoxState();
  }
}

class _AnimatedDecoratedBoxState
    extends AnimatedWidgetBaseState<AnimatedDecoratedBox> {
  DecorationTween? _decoration; //定义一个Tween

  @override
  Widget build(BuildContext context) {
    if (_decoration == null) {
      return widget.child;
    }
    return DecoratedBox(
      decoration: _decoration!.evaluate(animation),
      child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    // 在需要更新Tween时，基类会调用此方法
    _decoration = visitor(_decoration, widget.decoration,
        (value) => DecorationTween(begin: value))! as DecorationTween;
  }
}
