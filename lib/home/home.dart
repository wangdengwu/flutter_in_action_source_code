import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_in_action_source_code/route/generate_route.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(children: [
          ListTile(
            leading: Icon(Icons.first_page),
            title: Text("计数器应用示例"),
            subtitle: Text("第一个Flutter应用"),
            onTap: () {
              Navigator.of(context).pushNamed(GenerateRoute.counter_2);
            },
          ),
          ListTile(
            leading: Icon(Icons.manage_search),
            title: Text("路由管理"),
            subtitle: Text("第一个Flutter应用"),
            onTap: () {
              Navigator.of(context).pushNamed(GenerateRoute.route_2);
            },
          ),
          ListTile(leading: Icon(Icons.widgets), title: Text('基础组件')),
        ]),
      ),
    );
  }
}
