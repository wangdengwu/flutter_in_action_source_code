import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_in_action_source_code/route/generate_route.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context)
          .loadString("asserts/jsons/home.json", cache: true),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final _exampleList = json.decode(snapshot.data);
          return ListView.separated(
            itemCount: _exampleList.length,
            itemBuilder: (context, index) {
              final json = _exampleList[index];
              ExampleItem exampleItem = ExampleItem.fromJson(json);
              return ListTile(
                leading: Icon(
                  GenerateRoute.iconMap[exampleItem.iconName],
                  size: 36,
                ),
                title: Text(exampleItem.title),
                subtitle: Text(exampleItem.subTitle),
                trailing: Text(exampleItem.trailing),
                onTap: () {
                  Navigator.of(context).pushNamed(exampleItem.routeName);
                },
              );
            },
            separatorBuilder: (context, index) =>
                Divider(color: Colors.black12, indent: 66),
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 36,
                  height: 36,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                  ),
                ),
                Text("加载中..."),
              ],
            ),
          );
        }
      },
    );
  }
}

class ExampleItem {
  final String iconName;
  final String title;
  final String subTitle;
  final String trailing;
  final String routeName;

  ExampleItem(
      this.iconName, this.title, this.subTitle, this.trailing, this.routeName);

  ExampleItem.fromJson(Map<String, dynamic> json)
      : iconName = json["iconName"],
        title = json["title"],
        subTitle = json["subTitle"],
        trailing = json["trailing"],
        routeName = json["routeName"];
}
