import 'package:flutter/material.dart';
import 'package:flutter_in_action_source_code/chapter8/eventbus.dart';
import 'package:flutter_in_action_source_code/home/home.dart';
import 'package:flutter_in_action_source_code/icon/show_icons.dart';
import 'package:flutter_in_action_source_code/info/info.dart';

class TabNavigation extends StatefulWidget {
  @override
  _TabNavigationState createState() => _TabNavigationState();
}

class _TabNavigationState extends State<TabNavigation> {
  /// 默认选中0
  int _selectedIndex = 0;

  final PageController _controller = PageController(initialPage: 0);

  // 禁止 PageView 滑动
  final ScrollPhysics neverScroll = const NeverScrollableScrollPhysics();

  DateTime? _lastPressedAt; //上次点击时间

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter实战"),
      ),
      body: PageView(
        physics: neverScroll,
        children: [
          Home(),
          ShowIcons(),
          Info(),
        ],
        controller: _controller,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '实例'),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: '图标'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: '简介'),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _controller.jumpToPage(index);
    });
    if (index == 0) {
      if (_lastPressedAt == null) {
        //两次点击间隔超过1秒则重新计时
        _lastPressedAt = DateTime.now();
        return;
      }
      if (_lastPressedAt != null &&
          DateTime.now().difference(_lastPressedAt!) < Duration(seconds: 1)) {
        bus.emit(scroll2Top);
      }
      _lastPressedAt = DateTime.now();
    }
  }
}
