import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_in_action_source_code/components/toast_config.dart';

class DialogWidget extends StatefulWidget {
  const DialogWidget({Key? key}) : super(key: key);

  @override
  _DialogWidgetState createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  // 弹出对话框
  Future<bool?> showDeleteConfirmDialog() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            ElevatedButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(false), // 关闭对话框
            ),
            ElevatedButton(
              child: Text("删除"),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  Future<int?> changeLanguage() async {
    int? i = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () => Navigator.pop(context, 1),
                child: const Text('中文简体'),
              ),
              SimpleDialogOption(
                onPressed: () => Navigator.pop(context, 2),
                child: const Text('美国英语'),
              ),
            ],
          );
        });
    return i;
  }

  Future<int?> showListDialog() async {
    int? index = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        var child = Column(
          children: <Widget>[
            ListTile(title: Text("请选择")),
            Expanded(
                child: ListView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("$index"),
                  onTap: () => Navigator.of(context).pop(index),
                );
              },
            )),
          ],
        );
        //使用AlertDialog会报错
        //return AlertDialog(content: child);
        return Dialog(child: child);
      },
    );
    return index;
  }

  // 弹出底部菜单列表模态对话框
  Future<int?> _showModalBottomSheet() {
    return showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: () => Navigator.of(context).pop(index),
            );
          },
        );
      },
    );
  }

  Future<bool?> showDeleteConfirmDialog3() {
    bool _withTree = false; //记录复选框是否选中
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),

                  ///组件方式
                  // DialogCheckbox(
                  //   value: _withTree, //默认不选中
                  //   onChanged: (bool value) {
                  //     //更新选中状态
                  //     _withTree = !_withTree;
                  //   },
                  // ),
                  ///StatefulBuilder方式
                  // StatefulBuilder(builder: (context, _setState) {
                  //   return Checkbox(
                  //     value: _withTree, //默认不选中
                  //     onChanged: (bool? value) {
                  //       //_setState方法实际就是该StatefulWidget的setState方法，
                  //       //调用后builder方法会重新被调用
                  //       _setState(() {
                  //         //更新选中状态
                  //         _withTree = !_withTree;
                  //       });
                  //     },
                  //   );
                  // }),
                  ///markNeedsBuild方式
                  Builder(builder: (context) {
                    return Checkbox(
                      // 依然使用Checkbox组件
                      value: _withTree,
                      onChanged: (bool? value) {
                        // 此时context为对话框UI的根Element，我们
                        // 直接将对话框UI对应的Element标记为dirty
                        (context as Element).markNeedsBuild();
                        _withTree = !_withTree;
                      },
                    );
                  }),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text("删除"),
              onPressed: () {
                // 将选中状态返回
                Navigator.of(context).pop(_withTree);
              },
            ),
          ],
        );
      },
    );
  }

  // 返回的是一个controller
  void _showBottomSheet(context) {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: () {
                // do something
                print("$index"); //TODO 消息传参？
                Navigator.of(context, rootNavigator: true).pop(index);
              },
            );
          },
        );
      },
    );
  }

  showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, //点击遮罩不关闭对话框
      builder: (context) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pop();
        });
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.only(top: 26.0),
                child: Text("正在加载，请稍后..."),
              )
            ],
          ),
        );
      },
    );
  }

  Future<DateTime?> _showDatePicker1() {
    var date = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date,
      lastDate: date.add(
        //未来30天可选
        Duration(days: 30),
      ),
    );
  }

  Future<DateTime?> _showDatePicker2() {
    var date = DateTime.now();
    return showCupertinoModalPopup(
      context: context,
      builder: (ctx) {
        return SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            minimumDate: date,
            maximumDate: date.add(
              Duration(days: 30),
            ),
            maximumYear: date.year + 1,
            onDateTimeChanged: (DateTime value) {
              print(value);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("对话框详解"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                //弹出对话框并等待其关闭
                bool? delete = await showDeleteConfirmDialog();
                if (delete == null || delete == false) {
                  MyToast.showToast("取消删除");
                } else {
                  MyToast.showToast("已确认删除");
                  //... 删除文件
                }
              },
              child: Text("AlertDialog"),
            ),
            ElevatedButton(
              onPressed: () async {
                int? index = await changeLanguage();
                if (index != null) {
                  MyToast.showToast("选择了：${index == 1 ? "中文简体" : "美国英语"}");
                }
              },
              child: Text("SimpleDialog"),
            ),
            ElevatedButton(
              onPressed: () async {
                int? index = await showListDialog();
                if (index != null) {
                  MyToast.showToast("点击了：$index");
                }
              },
              child: Text("Dialog"),
            ),
            ElevatedButton(
              onPressed: () async {
                bool? delete = await showCustomDialog<bool>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("提示"),
                        content: Text("您确定要删除当前文件吗?"),
                        actions: <Widget>[
                          ElevatedButton(
                            child: Text("取消"),
                            onPressed: () => Navigator.of(context).pop(false),
                          ),
                          ElevatedButton(
                            child: Text("删除"),
                            onPressed: () {
                              // 执行删除操作
                              Navigator.of(context).pop(true);
                            },
                          ),
                        ],
                      );
                    });

                if (delete == null || delete == false) {
                  MyToast.showToast("取消删除");
                } else {
                  MyToast.showToast("已确认删除");
                  //... 删除文件
                }
              },
              child: Text("CustomDialog"),
            ),
            ElevatedButton(
              onPressed: () async {
                //弹出删除确认对话框，等待用户确认
                bool? deleteTree = await showDeleteConfirmDialog3();
                if (deleteTree == null) {
                  MyToast.showToast("取消删除");
                } else {
                  MyToast.showToast("同时删除子目录: $deleteTree");
                }
              },
              child: Text("复选框可点击"),
            ),
            ElevatedButton(
              onPressed: () async {
                int? type = await _showModalBottomSheet();
                MyToast.showToast("$type");
              },
              child: Text("显示底部菜单列表"),
            ),
            Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  _showBottomSheet(context);
                  // MyToast.showToast(controller);
                },
                child: Text("showBottomSheet"),
              );
            }),
            ElevatedButton(
              onPressed: () {
                showLoadingDialog();
              },
              child: Text("显示加载中,2秒自动消失"),
            ),
            ElevatedButton(
              onPressed: () {
                _showDatePicker1().then(
                  (value) => MyToast.showToast(value?.toString() ?? "没有选择日期"),
                );
              },
              child: Text("安卓风格日期选择"),
            ),
            ElevatedButton(
              onPressed: () {
                _showDatePicker2().then(
                      (value) => MyToast.showToast(value?.toString() ?? "没有选择日期"),
                );
              },
              child: Text("iOS风格日期选择"),
            ),
          ],
        ),
      ),
    );
  }
}

Future<T?> showCustomDialog<T>({
  required BuildContext context,
  bool barrierDismissible = true,
  required WidgetBuilder builder,
}) {
  final ThemeData theme = Theme.of(context);
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      final Widget pageChild = Builder(builder: builder);
      return SafeArea(
        child: Builder(builder: (BuildContext context) {
          return Theme(data: theme, child: pageChild);
        }),
      );
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black87,
    // 自定义遮罩颜色
    transitionDuration: const Duration(milliseconds: 150),
    transitionBuilder: _buildMaterialDialogTransitions,
  );
}

Widget _buildMaterialDialogTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  // 使用缩放动画
  return ScaleTransition(
    scale: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}

///checkbox
// 单独封装一个内部管理选中状态的复选框组件
class DialogCheckbox extends StatefulWidget {
  DialogCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final ValueChanged<bool> onChanged;
  final bool value;

  @override
  _DialogCheckboxState createState() => _DialogCheckboxState();
}

class _DialogCheckboxState extends State<DialogCheckbox> {
  late bool value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (v) {
        //将选中状态通过事件的形式抛出
        widget.onChanged(v ?? false);
        setState(() {
          //更新自身选中状态
          value = v ?? false;
        });
      },
    );
  }
}
