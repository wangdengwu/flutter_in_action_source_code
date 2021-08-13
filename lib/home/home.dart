import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_in_action_source_code/route/generate_route.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(
                Icons.first_page,
                size: 36,
              ),
              title: Text("计数器应用示例"),
              subtitle: Text("第一个Flutter应用"),
              trailing: Text("chapter2"),
              onTap: () {
                Navigator.of(context).pushNamed(GenerateRoute.counter_2);
              },
            ),
            Divider(
              color: Colors.black12,
              indent: 66,
            ),
            ListTile(
              leading: Icon(
                Icons.first_page,
                size: 36,
              ),
              title: Text("路由管理"),
              subtitle: Text("第一个Flutter应用"),
              trailing: Text("chapter2"),
              onTap: () {
                Navigator.of(context).pushNamed(GenerateRoute.route_2);
              },
            ),
            Divider(
              color: Colors.black12,
              indent: 66,
            ),
            ListTile(
              leading: Icon(
                Icons.first_page,
                size: 36,
              ),
              title: Text("包管理"),
              subtitle: Text("第一个Flutter应用"),
              trailing: Text("chapter2"),
              onTap: () {
                Navigator.of(context).pushNamed(GenerateRoute.package_2);
              },
            ),
            Divider(
              color: Colors.black12,
              indent: 66,
            ),
            ListTile(
              leading: Icon(
                Icons.first_page,
                size: 36,
              ),
              title: Text("资源管理"),
              subtitle: Text("第一个Flutter应用"),
              trailing: Text("chapter2"),
              onTap: () {
                Navigator.of(context).pushNamed(GenerateRoute.assets_2);
              },
            ),
            Divider(
              color: Colors.black12,
              indent: 66,
            ),
            ListTile(
              leading: Icon(
                Icons.widgets,
                size: 36,
              ),
              title: Text("widget简介"),
              subtitle: Text("基础组件"),
              trailing: Text("chapter3"),
              onTap: () {
                Navigator.of(context).pushNamed(GenerateRoute.widget_intro_3);
              },
            ),
            Divider(
              color: Colors.black12,
              indent: 66,
            ),
            ListTile(
              leading: Icon(
                Icons.widgets,
                size: 36,
              ),
              title: Text("状态管理"),
              subtitle: Text("基础组件"),
              trailing: Text("chapter3"),
              onTap: () {
                Navigator.of(context).pushNamed(GenerateRoute.state_manage_3);
              },
            ),
            Divider(
              color: Colors.black12,
              indent: 66,
            ),
            ListTile(
              leading: Icon(
                Icons.widgets,
                size: 36,
              ),
              title: Text("文本及样式"),
              subtitle: Text("基础组件"),
              trailing: Text("chapter3"),
              onTap: () {
                Navigator.of(context).pushNamed(GenerateRoute.texts_3);
              },
            ),
            Divider(
              color: Colors.black12,
              indent: 66,
            ),
            ListTile(
              leading: Icon(
                Icons.widgets,
                size: 36,
              ),
              title: Text("按钮"),
              subtitle: Text("基础组件"),
              trailing: Text("chapter3"),
              onTap: () {
                Navigator.of(context).pushNamed(GenerateRoute.buttons_3);
              },
            ),
            Divider(
              color: Colors.black12,
              indent: 66,
            ),
            ListTile(
              leading: Icon(
                Icons.widgets,
                size: 36,
              ),
              title: Text("图片及ICON"),
              subtitle: Text("基础组件"),
              trailing: Text("chapter3"),
              onTap: () {
                Navigator.of(context).pushNamed(GenerateRoute.img_icon_3);
              },
            ),
            Divider(
              color: Colors.black12,
              indent: 66,
            ),
            ListTile(
              leading: Icon(
                Icons.widgets,
                size: 36,
              ),
              title: Text("单选开关和复选框"),
              subtitle: Text("基础组件"),
              trailing: Text("chapter3"),
              onTap: () {
                Navigator.of(context).pushNamed(GenerateRoute.radio_checkbox_3);
              },
            ),
            Divider(
              color: Colors.black12,
              indent: 66,
            ),
            ListTile(
              leading: Icon(
                Icons.widgets,
                size: 36,
              ),
              title: Text("输入框及表单"),
              subtitle: Text("基础组件"),
              trailing: Text("chapter3"),
              onTap: () {
                Navigator.of(context).pushNamed(GenerateRoute.input_form_3);
              },
            ),
            Divider(
              color: Colors.black12,
              indent: 66,
            ),
            ListTile(
              leading: Icon(
                Icons.widgets,
                size: 36,
              ),
              title: Text("进度指示器"),
              subtitle: Text("基础组件"),
              trailing: Text("chapter3"),
              onTap: () {
                Navigator.of(context).pushNamed(GenerateRoute.progress_3);
              },
            ),
            //row_column.dart
            Divider(
              color: Colors.black12,
              indent: 66,
            ),
            ListTile(
              leading: Icon(
                Icons.layers,
                size: 36,
              ),
              title: Text("线性布局（Row和Column）"),
              subtitle: Text("布局类组件"),
              trailing: Text("chapter4"),
              onTap: () {
                Navigator.of(context).pushNamed(GenerateRoute.row_column_4);
              },
            ),
          ],
        ),
      ),
    );
  }
}
