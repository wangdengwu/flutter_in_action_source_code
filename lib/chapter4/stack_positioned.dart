import 'package:flutter/material.dart';

class StackPositionedWidget extends StatefulWidget {
  const StackPositionedWidget({Key? key}) : super(key: key);

  @override
  _StackPositionedWidgetState createState() => _StackPositionedWidgetState();
}

class _StackPositionedWidgetState extends State<StackPositionedWidget>
    with SingleTickerProviderStateMixin {
  static const List<Tab> alignmentFit = <Tab>[
    Tab(text: 'alignment'),
    Tab(text: 'fit'),
  ];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: alignmentFit.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("层叠布局 Stack、Positioned"),
        bottom: TabBar(
          controller: _tabController,
          tabs: alignmentFit,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ///Row
          //通过ConstrainedBox来确保Stack占满屏幕
          ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Stack(
              alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
              children: <Widget>[
                Container(
                  child: Text("Hello world",
                      style: TextStyle(color: Colors.white)),
                  color: Colors.red,
                ),
                Positioned(
                  left: 18.0,
                  child: Text("I am Jack"),
                ),
                Positioned(
                  top: 18.0,
                  child: Text("Your friend"),
                )
              ],
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand, //未定位widget占满Stack整个空间
              children: <Widget>[
                Positioned(
                  left: 18.0,
                  child: Text("I am Jack"),
                ),
                Container(
                  child: Text("Hello world",
                      style: TextStyle(color: Colors.white)),
                  color: Colors.red,
                ),
                Positioned(
                  top: 18.0,
                  child: Text("Your friend"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
