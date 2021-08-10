import 'package:flutter/material.dart';
import 'package:flutter_in_action_source_code/navigation/tab_navigation.dart';
import 'package:flutter_in_action_source_code/route/generate_route.dart';

void main() {
  runApp(FlutterInAction());
}

class FlutterInAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: false,
      title: "Flutter实战",
      debugShowCheckedModeBanner: false,
      onGenerateRoute: GenerateRoute.generateRoute,
      theme: ThemeData.light(),
      home: TabNavigation(),
    );
  }
}
