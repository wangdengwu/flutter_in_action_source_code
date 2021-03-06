import 'package:flutter/material.dart';
import 'package:flutter_in_action_source_code/chapter10/combine.dart';
import 'package:flutter_in_action_source_code/chapter10/custom_paint.dart';
import 'package:flutter_in_action_source_code/chapter10/gradient_circular_progress.dart';
import 'package:flutter_in_action_source_code/chapter10/turn_box.dart';
import 'package:flutter_in_action_source_code/chapter11/dio.dart';
import 'package:flutter_in_action_source_code/chapter11/file_operation.dart';
import 'package:flutter_in_action_source_code/chapter11/http.dart';
import 'package:flutter_in_action_source_code/chapter12/image_picker.dart';
import 'package:flutter_in_action_source_code/chapter12/jpush.dart';
import 'package:flutter_in_action_source_code/chapter12/scan.dart';
import 'package:flutter_in_action_source_code/chapter12/video_player.dart';
import 'package:flutter_in_action_source_code/chapter11/webview.dart';
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
import 'package:flutter_in_action_source_code/chapter6/scroll_controller.dart';
import 'package:flutter_in_action_source_code/chapter6/single_child_scrollview.dart';
import 'package:flutter_in_action_source_code/chapter7/dialog.dart';
import 'package:flutter_in_action_source_code/chapter7/futurebuilder_and_streambuilder.dart';
import 'package:flutter_in_action_source_code/chapter7/inherited_widget.dart';
import 'package:flutter_in_action_source_code/chapter7/provider.dart';
import 'package:flutter_in_action_source_code/chapter7/theme.dart';
import 'package:flutter_in_action_source_code/chapter7/willpopscope.dart';
import 'package:flutter_in_action_source_code/chapter8/gesture.dart';
import 'package:flutter_in_action_source_code/chapter8/listener.dart';
import 'package:flutter_in_action_source_code/chapter8/notification.dart';
import 'package:flutter_in_action_source_code/chapter9/animated_switcher.dart';
import 'package:flutter_in_action_source_code/chapter9/animated_widgets.dart';
import 'package:flutter_in_action_source_code/chapter9/animation_structure.dart';
import 'package:flutter_in_action_source_code/chapter9/hero.dart';
import 'package:flutter_in_action_source_code/chapter9/route_transition.dart';
import 'package:flutter_in_action_source_code/chapter9/stagger_animation.dart';

class GenerateRoute {
  static const iconMap = {
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
  static const String scroll_controller_6 = "scroll_controller_6";
  static const String willpopscope_7 = "willpopscope_7";
  static const String inherited_widget_7 = "inherited_widget_7";
  static const String provider_7 = "provider_7";
  static const String theme_7 = "theme_7";
  static const String futurebuilder_and_streambuilder_7 =
      "futurebuilder_and_streambuilder_7";
  static const String dialog_7 = "dialog_7";
  static const String listener_8 = "listener_8";
  static const String gesture_8 = "gesture_8";
  static const String notification_8 = "notification_8";
  static const String animation_structure_9 = "animation_structure_9";
  static const String route_transition_9 = "route_transition_9";
  static const String hero_9 = "hero_9";
  static const String stagger_animation_9 = "stagger_animation_9";
  static const String animated_switcher_9 = "animated_switcher_9";
  static const String animated_widgets_9 = "animated_widgets_9";
  static const String combine_10 = "combine_10";
  static const String turn_box_10 = "turn_box_10";
  static const String custom_paint_10 = "custom_paint_10";
  static const String gradient_circular_progress_10 =
      "gradient_circular_progress_10";
  static const String file_operation_11 = "file_operation_11";
  static const String http_11 = "http_11";
  static const String dio_11 = "dio_11";
  static const String webview_11 = "webview_11";
  static const String image_picker_12 = "image_picker_12";
  static const String jpush_12 = "jpush_12";
  static const String video_player_12 = "video_player_12";
  static const String scan_12 = "scan_12";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      ///??????????????????
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
      case scroll_controller_6:
        return MaterialPageRoute(builder: (context) {
          return ScrollControllerWidget();
        });
      case willpopscope_7:
        return MaterialPageRoute(builder: (context) {
          return WillPopScopeWidget();
        });
      case inherited_widget_7:
        return MaterialPageRoute(builder: (context) {
          return InheritedWidgetDemo();
        });
      case provider_7:
        return MaterialPageRoute(builder: (context) {
          return ProviderRoute();
        });
      case theme_7:
        return MaterialPageRoute(builder: (context) {
          return ThemeTestRoute();
        });
      case futurebuilder_and_streambuilder_7:
        return MaterialPageRoute(builder: (context) {
          return FutureStreamBuilderWidget();
        });
      case dialog_7:
        return MaterialPageRoute(builder: (context) {
          return DialogWidget();
        });
      case listener_8:
        return MaterialPageRoute(builder: (context) {
          return ListenerWidget();
        });
      case gesture_8:
        return MaterialPageRoute(builder: (context) {
          return GestureWidget();
        });
      case notification_8:
        return MaterialPageRoute(builder: (context) {
          return NotificationWidget();
        });
      case animation_structure_9:
        return MaterialPageRoute(builder: (context) {
          return AnimationStructureWidget();
        });
      case route_transition_9:
        return FadeRoute(
          child: RouteTransitionWidget(),
        );
      case hero_9:
        return MaterialPageRoute(builder: (context) {
          return HeroWidget();
        });
      case stagger_animation_9:
        return MaterialPageRoute(builder: (context) {
          return StaggerAnimationWidget();
        });
      case animated_switcher_9:
        return MaterialPageRoute(builder: (context) {
          return AnimatedSwitcherWidget();
        });
      case animated_widgets_9:
        return MaterialPageRoute(builder: (context) {
          return AnimatedWidgets();
        });
      case combine_10:
        return MaterialPageRoute(builder: (context) {
          return CombineWidget();
        });
      case turn_box_10:
        return MaterialPageRoute(builder: (context) {
          return TurnBoxRoute();
        });
      case custom_paint_10:
        return MaterialPageRoute(builder: (context) {
          return CustomPaintRoute();
        });
      case gradient_circular_progress_10:
        return MaterialPageRoute(builder: (context) {
          return GradientCircularProgressRoute();
        });
      case file_operation_11:
        return MaterialPageRoute(builder: (context) {
          return FileOperationRoute();
        });
      case http_11:
        return MaterialPageRoute(builder: (context) {
          return HttpTestRoute();
        });
      case dio_11:
        return MaterialPageRoute(builder: (context) {
          return FutureBuilderRoute();
        });
      case webview_11:
        return MaterialPageRoute(builder: (context) {
          return WebViewExample();
        });
      case image_picker_12:
        return MaterialPageRoute(builder: (context) {
          return MyHomePage();
        });
      case jpush_12:
        return MaterialPageRoute(builder: (context) {
          return JpushWidget();
        });
      case video_player_12:
        return MaterialPageRoute(builder: (context) {
          return VideoApp();
        });
      case scan_12:
        return MaterialPageRoute(builder: (context) {
          return ScanWidget();
        });
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: Text("?????????"),),
            body: Center(
              child: Text('?????????${settings.name}???????????????'),
            ),
          ),
        );
    }
  }
}
