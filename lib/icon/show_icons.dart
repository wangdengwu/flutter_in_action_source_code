import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_in_action_source_code/iconfont/icon_font.dart';

class ShowIcons extends StatelessWidget {
  ShowIcons({Key? key}) : super(key: key);
  final Map<String, IconData> _icons = {
    "first_page": Icons.first_page,
    "widgets": Icons.widgets,
    "layers": Icons.layers,
    "all_inbox": Icons.all_inbox,
    "pages": Icons.pages,
    "functions": Icons.functions,
    "notifications": Icons.notifications,
    "animation": Icons.animation,
    "settings_input_component": Icons.settings_input_component,
    "network_check": Icons.network_check,
    "file_copy": Icons.file_copy,
    "open_in_browser": Icons.open_in_browser,
    "device_hub": Icons.device_hub,
    "image": Icons.image,
    "play_arrow": Icons.play_arrow,
    "camera": Icons.camera,
    "system_management": MyIcons.system_management,
    "allow": MyIcons.allow,
    "remove": MyIcons.remove,
    "badge": MyIcons.badge,
    "clear_all": MyIcons.clear_all,
    "launch": MyIcons.launch,
    "zhifubao": MyIcons.zhifubao,
    "gitee": MyIcons.gitee,
    "github": MyIcons.github,
  }; //保存Icon数据

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //每行三列
          childAspectRatio: 1.0 //显示区域宽高相等
          ),
      itemCount: _icons.length,
      itemBuilder: (context, index) {
        // print(_icons.values.take(index));
        return Column(
          children: [
            Icon(
              _icons.values.elementAt(index),
              color: Colors.blue,
              size: 36,
            ),
            Text(_icons.keys.elementAt(index)),
          ],
        );
      },
    );
  }
}
