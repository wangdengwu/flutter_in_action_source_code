import 'package:flutter/material.dart';

class ScrollControllerWidget extends StatefulWidget {
  const ScrollControllerWidget({Key? key}) : super(key: key);

  @override
  _ScrollControllerWidgetState createState() => _ScrollControllerWidgetState();
}

class _ScrollControllerWidgetState extends State<ScrollControllerWidget>
    with SingleTickerProviderStateMixin {
  static const List<Tab> tabs = <Tab>[
    Tab(text: 'ScrollController'),
    Tab(text: '滚动监听'),
  ];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
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
        title: Text("滚动监听及控制"),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs,
        ),
      ),
      body: TabBarView(controller: _tabController, children: [
        ScrollControllerTestRoute(key: PageStorageKey(1)),
        ScrollNotificationTestRoute(key: PageStorageKey(2)),
      ]),
    );
  }
}

class ScrollControllerTestRoute extends StatefulWidget {
  ScrollControllerTestRoute({required Key key}) : super(key: key);

  @override
  ScrollControllerTestRouteState createState() =>
      ScrollControllerTestRouteState();
}

class ScrollControllerTestRouteState extends State<ScrollControllerTestRoute> {
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮

  @override
  void initState() {
    super.initState();
    //监听滚动事件
    _controller.addListener(() {
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
          PageStorage.of(context)?.writeState(context, showToTopBtn);
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
          PageStorage.of(context)?.writeState(context, showToTopBtn);
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    bool? top = PageStorage.of(context)?.readState(context);
    if (top != null) {
      showToTopBtn = top;
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: ListView.builder(
          key: PageStorageKey(1),
          itemCount: 100,
          itemExtent: 50.0,
          //列表项高度固定时，显式指定高度是一个好习惯(性能消耗小)
          controller: _controller,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("$index"),
            );
          },
        ),
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                //返回到顶部时执行动画
                _controller.animateTo(.0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              }),
    );
  }
}

class ScrollNotificationTestRoute extends StatefulWidget {
  ScrollNotificationTestRoute({required Key key}) : super(key: key);

  @override
  _ScrollNotificationTestRouteState createState() =>
      _ScrollNotificationTestRouteState();
}

class _ScrollNotificationTestRouteState
    extends State<ScrollNotificationTestRoute> {
  String _progress = "0%"; //保存进度百分比

  @override
  void didChangeDependencies() {
    String? progress = PageStorage.of(context)?.readState(context);
    if (progress != null) {
      _progress = progress;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      //进度条
      // 监听滚动通知
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          double progress = notification.metrics.pixels /
              notification.metrics.maxScrollExtent;
          //重新构建
          setState(() {
            _progress = "${(progress * 100).toInt()}%";
            PageStorage.of(context)?.writeState(context, _progress);
          });
          // print("BottomEdge: ${notification.metrics.extentAfter == 0}");
          return false; //返回true，阻止冒泡，则进度条消失。
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ListView.builder(
              key: PageStorageKey(2),
              itemCount: 100,
              itemExtent: 50.0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("$index"),
                );
              },
            ),
            CircleAvatar(
              //显示进度百分比
              radius: 30.0,
              child: Text(_progress),
              backgroundColor: Colors.black54,
            )
          ],
        ),
      ),
    );
  }
}
