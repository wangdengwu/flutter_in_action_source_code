import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';

class InputForm extends StatelessWidget {
  const InputForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("输入框及表单"),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginFormShowText(),
            LoginFormSubmit(),
          ],
        ),
      )),
    );
  }
}

class LoginFormShowText extends StatefulWidget {
  const LoginFormShowText({Key? key}) : super(key: key);

  @override
  _LoginFormShowTextState createState() => _LoginFormShowTextState();
}

class _LoginFormShowTextState extends State<LoginFormShowText> {
  TextEditingController _unameController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();
  String _showText = "";

  @override
  void initState() {
    super.initState();
    _unameController.text = "默认值";
    _unameController.selection = TextSelection(
        baseOffset: 1, extentOffset: _unameController.text.length);
    _unameController.addListener(() {
      setState(() {
        _showText = _unameController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(20.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        border: new Border.all(
          width: 0,
          color: Colors.black12,
        ),
      ),
      child: Column(
        children: [
          Text(_showText),
          TextField(
            autofocus: true,
            controller: _unameController,
            decoration: InputDecoration(
              labelText: "用户名",
              hintText: "用户名或邮箱",
              prefixIcon: Icon(Icons.person),
            ),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "密码",
              hintText: "您的登录密码",
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            onSubmitted: (text) => setState(() => _showText = "密码:$text"),
          ),
          SizedBox(
            height: 8,
          ),
          Text("获取输入内容"),
        ],
      ),
    );
  }
}

class LoginFormSubmit extends StatefulWidget {
  const LoginFormSubmit({Key? key}) : super(key: key);

  @override
  _LoginFormSubmitState createState() => _LoginFormSubmitState();
}

class _LoginFormSubmitState extends State<LoginFormSubmit> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(20.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        border: new Border.all(
          width: 0,
          color: Colors.black12,
        ),
      ),
      child: Form(
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              controller: _unameController,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person),
              ),
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              validator: (v) {
                return v != null && v.trim().length > 0 ? null : "用户名不能为空";
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "您的登录密码",
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              //校验密码
              validator: (v) {
                return v != null && v.trim().length > 5 ? null : "密码不能少于6位";
              },
            ),
            // 登录按钮
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Builder(builder: (context) {
                      return ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.all(15.0),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColor),
                          textStyle: MaterialStateProperty.all(TextStyle(
                            color: Colors.white,
                          )),
                        ),
                        child: Text("登录"),
                        onPressed: () {
                          bool ok = Form.of(context)?.validate() ?? false;
                          if (ok) {
                            //验证通过提交数据
                            showToast(
                              "用户名:${_unameController.text},密码:${_passwordController.text}",
                            );
                          }
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
