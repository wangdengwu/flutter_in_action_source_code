import 'package:flutter/material.dart';
import 'package:flutter_in_action_source_code/chapter2/assert_manage.dart';
import 'package:flutter_in_action_source_code/chapter2/counter.dart';
import 'package:flutter_in_action_source_code/chapter2/package_manage.dart';
import 'package:flutter_in_action_source_code/chapter2/route_manage.dart';

class GenerateRoute {
  static const String counter_2 = 'counter_2';
  static const String route_2 = 'route_2';
  static const String package_2 = 'package_2';
  static const String assets_2 = 'assets_2';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      ///第一个计数器
      case counter_2:
        return MaterialPageRoute(builder: (context) {
          dynamic count = settings.arguments;
          return CounterApp(counter: count);
        });
      case route_2:
        return MaterialPageRoute(builder: (context) {
          return RouteManage();
        });
      case package_2:
        return MaterialPageRoute(builder: (context) {
          return PackageManage();
        });
      case assets_2:
        return MaterialPageRoute(builder: (context) {
          return AssertManage();
        });
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('找不到${settings.name}对应的路由'),
            ),
          ),
        );
    }
  }
}
