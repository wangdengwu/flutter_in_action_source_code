import 'package:flutter/material.dart';

class MaterialScaffoldWidget extends StatefulWidget {
  const MaterialScaffoldWidget({Key? key}) : super(key: key);

  @override
  _MaterialScaffoldWidgetState createState() => _MaterialScaffoldWidgetState();
}

class _MaterialScaffoldWidgetState extends State<MaterialScaffoldWidget> {
  int _selectedIndex = 0;
  final PageController _bottomNavController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _bottomNavController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          One(),
          Two(),
          Three(),
        ],
        controller: _bottomNavController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.one_k), label: "一"),
          BottomNavigationBarItem(icon: Icon(Icons.two_k), label: "二"),
          BottomNavigationBarItem(icon: Icon(Icons.three_k), label: "三"),
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
      _bottomNavController.jumpToPage(index);
    });
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "asserts/images/avatar.jpeg",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "Flutter",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class One extends StatefulWidget {
  const One({Key? key}) : super(key: key);

  @override
  _OneState createState() => _OneState();
}

class _OneState extends State<One> with SingleTickerProviderStateMixin {
  List tabs = ["一一", "一二", "一三"];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
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
        //导航栏
        title: Text("脚手架"),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.dashboard, color: Colors.white), //自定义图标
              onPressed: () {
                // 打开抽屉菜单
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
        bottom: TabBar(
          //生成Tab菜单
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
      drawer: MyDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: Text(
              "一一",
              style: TextStyle(fontSize: 60, fontFamily: "pinyin"),
            ),
          ),
          Center(
            child: Text(
              "一二",
              style: TextStyle(fontSize: 60, fontFamily: "pinyin"),
            ),
          ),
          Center(
            child: Text(
              "一三",
              style: TextStyle(fontSize: 60, fontFamily: "pinyin"),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        //悬浮按钮
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

class Two extends StatelessWidget {
  const Two({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "二",
          style: TextStyle(fontSize: 60, fontFamily: "pinyin"),
        ),
      ),
    );
  }
}

class Three extends StatelessWidget {
  const Three({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "三",
          style: TextStyle(fontSize: 60, fontFamily: "pinyin"),
        ),
      ),
    );
  }
}
