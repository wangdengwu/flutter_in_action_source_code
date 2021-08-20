import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_in_action_source_code/route/generate_route.dart';
import 'package:oktoast/oktoast.dart';

class RouteManage extends StatelessWidget {
  const RouteManage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("路由管理"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              child: Text("open new route"),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return NewRoute();
                }),
              ),
            ),
            SizedBox(height: 8),
            OutlinedButton(
              child: Text("打开提示页"),
              onPressed: () async {
                var result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return TipRoute(
                      text: "我是传入的参数",
                    );
                  }),
                );
                if (result != null) {
                  showToast(result);
                }
              },
            ),
            SizedBox(height: 8),
            ElevatedButton(
              child: Text("命名路由"),
              onPressed: () {
                Navigator.pushNamed(context, GenerateRoute.counter_2);
              },
            ),
            SizedBox(height: 12),
            ElevatedButton.icon(
              icon: Icon(Icons.message),
              label: Text("命名路由传参"),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(GenerateRoute.counter_2, arguments: 8);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}

class TipRoute extends StatelessWidget {
  TipRoute({
    Key? key,
    required this.text, // 接收一个text参数
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("路由传参"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text("点击返回参数"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
