import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureWidget extends StatefulWidget {
  const GestureWidget({Key? key}) : super(key: key);

  @override
  _GestureWidgetState createState() => _GestureWidgetState();
}

class _GestureWidgetState extends State<GestureWidget> {
  String _operation = "No Gesture detected!"; //保存事件名
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移
  double _onlyTop = 0.0;
  double _leftB = 0.0;
  bool _toggle = false; //变色开关
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手势识别"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              width: 200.0,
              height: 100.0,
              margin: EdgeInsets.all(10),
              child: Text(
                _operation,
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: () => updateText("Tap"), //点击
            onDoubleTap: () => updateText("DoubleTap"), //双击
            onLongPress: () => updateText("LongPress"), //长按
          ),
          SizedBox(
            height: 100,
            width: 200,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black12,
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: _top,
                    left: _left,
                    child: GestureDetector(
                      child: CircleAvatar(child: Text("A")),
                      //手指按下时会触发此回调
                      onPanDown: (DragDownDetails e) {
                        //打印手指按下的位置(相对于屏幕)
                        print("用户手指按下：${e.globalPosition}");
                      },
                      //手指滑动时会触发此回调
                      onPanUpdate: (DragUpdateDetails e) {
                        //用户手指滑动时，更新偏移，重新构建
                        setState(() {
                          _left += e.delta.dx;
                          _top += e.delta.dy;
                        });
                      },
                      onPanEnd: (DragEndDetails e) {
                        //打印滑动结束时在x、y轴上的速度
                        print(e.velocity);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 100,
            width: 200,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black12,
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: _onlyTop,
                    left: 85,
                    child: GestureDetector(
                      child: CircleAvatar(child: Text("A")),
                      //垂直方向拖动事件
                      onVerticalDragUpdate: (DragUpdateDetails details) {
                        setState(() {
                          _onlyTop += details.delta.dy;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: "你好世界"),
                TextSpan(
                  text: "点我变色",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: _toggle ? Colors.blue : Colors.red,
                  ),
                  recognizer: _tapGestureRecognizer
                    ..onTap = () {
                      setState(() {
                        _toggle = !_toggle;
                      });
                    },
                ),
                TextSpan(text: "你好世界"),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 100,
            width: 200,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black12,
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 30.0,
                    left: _leftB,
                    child: Listener(
                      onPointerDown: (details) {
                        print("down");
                      },
                      onPointerUp: (details) {
                        //会触发
                        print("up");
                      },
                      child: GestureDetector(
                        child: CircleAvatar(child: Text("B")),
                        onHorizontalDragUpdate: (DragUpdateDetails details) {
                          setState(() {
                            _leftB += details.delta.dx;
                          });
                        },
                        onHorizontalDragEnd: (details) {
                          print("onHorizontalDragEnd");
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}
