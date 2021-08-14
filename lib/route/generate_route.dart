import 'package:flutter/material.dart';
import 'package:flutter_in_action_source_code/chapter2/assert_manage.dart';
import 'package:flutter_in_action_source_code/chapter2/counter.dart';
import 'package:flutter_in_action_source_code/chapter2/package_manage.dart';
import 'package:flutter_in_action_source_code/chapter2/route_manage.dart';
import 'package:flutter_in_action_source_code/chapter3/buttons.dart';
import 'package:flutter_in_action_source_code/chapter3/img_icon.dart';
import 'package:flutter_in_action_source_code/chapter3/input_form.dart';
import 'package:flutter_in_action_source_code/chapter3/progress.dart';
import 'package:flutter_in_action_source_code/chapter3/radio_checkbox.dart';
import 'package:flutter_in_action_source_code/chapter3/state_manage.dart';
import 'package:flutter_in_action_source_code/chapter3/texts.dart';
import 'package:flutter_in_action_source_code/chapter3/widget_intro.dart';
import 'package:flutter_in_action_source_code/chapter4/alignment.dart';
import 'package:flutter_in_action_source_code/chapter4/flex.dart';
import 'package:flutter_in_action_source_code/chapter4/row_column.dart';
import 'package:flutter_in_action_source_code/chapter4/stack_positioned.dart';
import 'package:flutter_in_action_source_code/chapter4/wrap_flow.dart';
import 'package:flutter_in_action_source_code/chapter5/clip.dart';
import 'package:flutter_in_action_source_code/chapter5/constrainedbox_sizedbox.dart';
import 'package:flutter_in_action_source_code/chapter5/container.dart';
import 'package:flutter_in_action_source_code/chapter5/decoratedbox.dart';
import 'package:flutter_in_action_source_code/chapter5/material_scaffold.dart';
import 'package:flutter_in_action_source_code/chapter5/padding.dart';
import 'package:flutter_in_action_source_code/chapter5/transform.dart';
import 'package:flutter_in_action_source_code/chapter6/custom_scrollview.dart';
import 'package:flutter_in_action_source_code/chapter6/gridview.dart';
import 'package:flutter_in_action_source_code/chapter6/listview.dart';
import 'package:flutter_in_action_source_code/chapter6/single_child_scrollview.dart';

class GenerateRoute {
  static const iconMap = {
    "first_page": Icons.first_page,
    "widgets": Icons.widgets,
    "layers": Icons.layers,
    "all_inbox": Icons.all_inbox,
    "pages": Icons.pages,
  };
  static const String counter_2 = "counter_2";
  static const String route_2 = "route_2";
  static const String package_2 = "package_2";
  static const String assets_2 = "assets_2";
  static const String widget_intro_3 = "widget_intro_3";
  static const String state_manage_3 = "state_manage_3";
  static const String texts_3 = "texts_3";
  static const String buttons_3 = "buttons_3";
  static const String img_icon_3 = "img_icon_3";
  static const String radio_checkbox_3 = "radio_checkbox_3";
  static const String input_form_3 = "input_form_3";
  static const String progress_3 = "progress_3";
  static const String row_column_4 = "row_column_4";
  static const String flex_4 = "flex_4";
  static const String wrap_flow_4 = "wrap_flow_4";
  static const String stack_positioned_4 = "stack_positioned_4";
  static const String alignment_4 = "alignment_4";
  static const String padding_5 = "padding_5";
  static const String constrainedbox_sizebox_5 = "constrainedbox_sizebox_5";
  static const String decoratedbox_5 = "decoratedbox_5";
  static const String transform_5 = "transform_5";
  static const String container_5 = "container_5";
  static const String material_scaffold_5 = "material_scaffold_5";
  static const String clip_5 = "clip_5";
  static const String single_child_scrollview_6 = "single_child_scrollview_6";
  static const String listview_6 = "listview_6";
  static const String gridview_6 = "gridview_6";
  static const String custom_scrollview_6 = "custom_scrollview_6";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      ///第一个计数器
      case counter_2:
        return MaterialPageRoute(builder: (context) {
          dynamic count = settings.arguments ?? 0;
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
      case widget_intro_3:
        return MaterialPageRoute(builder: (context) {
          return WidgetIntro();
        });
      case state_manage_3:
        return MaterialPageRoute(builder: (context) {
          return StateManage();
        });
      case texts_3:
        return MaterialPageRoute(builder: (context) {
          return TextsWidget();
        });
      case buttons_3:
        return MaterialPageRoute(builder: (context) {
          return ButtonsWidget();
        });
      case img_icon_3:
        return MaterialPageRoute(builder: (context) {
          return ImageIconWidget();
        });
      case radio_checkbox_3:
        return MaterialPageRoute(builder: (context) {
          return RadioCheckBox();
        });
      case input_form_3:
        return MaterialPageRoute(builder: (context) {
          return InputForm();
        });
      case progress_3:
        return MaterialPageRoute(builder: (context) {
          return ProgressWidget();
        });
      case row_column_4:
        return MaterialPageRoute(builder: (context) {
          return RowColumnWidget();
        });
      case flex_4:
        return MaterialPageRoute(builder: (context) {
          return FlexWidget();
        });
      case wrap_flow_4:
        return MaterialPageRoute(builder: (context) {
          return WrapFlowWidget();
        });
      case stack_positioned_4:
        return MaterialPageRoute(builder: (context) {
          return StackPositionedWidget();
        });
      case alignment_4:
        return MaterialPageRoute(builder: (context) {
          return AlignmentWidget();
        });
      case padding_5:
        return MaterialPageRoute(builder: (context) {
          return PaddingWidget();
        });
      case constrainedbox_sizebox_5:
        return MaterialPageRoute(builder: (context) {
          return ConstrainedBoxSizedBoxWidget();
        });
      case decoratedbox_5:
        return MaterialPageRoute(builder: (context) {
          return DecoratedBoxWidget();
        });
      case transform_5:
        return MaterialPageRoute(builder: (context) {
          return TransformWidget();
        });
      case container_5:
        return MaterialPageRoute(builder: (context) {
          return ContainerWidget();
        });
      case material_scaffold_5:
        return MaterialPageRoute(builder: (context) {
          return MaterialScaffoldWidget();
        });
      case clip_5:
        return MaterialPageRoute(builder: (context) {
          return ClipWidget();
        });
      case single_child_scrollview_6:
        return MaterialPageRoute(builder: (context) {
          return SingleChildScrollViewWidget();
        });
      case listview_6:
        return MaterialPageRoute(builder: (context) {
          return ListViewWidget();
        });
      case gridview_6:
        return MaterialPageRoute(builder: (context) {
          return GridViewWidget();
        });
      case custom_scrollview_6:
        return MaterialPageRoute(builder: (context) {
          return CustomScrollViewTestRoute();
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
