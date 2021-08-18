import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HttpTestRoute extends StatefulWidget {
  @override
  _HttpTestRouteState createState() => new _HttpTestRouteState();
}

class _HttpTestRouteState extends State<HttpTestRoute> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter.cn"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<WebViewController>(
              future: _controller.future,
              builder: (BuildContext context,
                  AsyncSnapshot<WebViewController> controller) {
                return ElevatedButton(
                    child: Text("获取Flutter纯文本"),
                    onPressed: _loading
                        ? null
                        : () async {
                            setState(() {
                              _loading = true;
                            });
                            try {
                              //创建一个HttpClient
                              HttpClient httpClient = new HttpClient();
                              //打开Http连接
                              HttpClientRequest request = await httpClient
                                  .getUrl(Uri.parse("https://flutter.cn/"));
                              //使用iPhone的UA
                              request.headers.add("user-agent",
                                  "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
                              //等待连接服务器（会将请求信息发送给服务器）
                              HttpClientResponse response =
                                  await request.close();
                              //读取响应内容
                              var _text =
                                  await response.transform(utf8.decoder).join();
                              var body = base64Encode(
                                  const Utf8Encoder().convert(_text));
                              //输出响应头
                              // print(response.headers);
                              controller.data
                                  ?.loadUrl('data:text/html;base64,$body');
                              controller.data?.evaluateJavascript("alert('Flutter实战');");
                              //关闭client后，通过该client发起的所有请求都会中止。
                              httpClient.close();
                            } catch (e) {
                              print("请求失败：$e");
                            } finally {
                              setState(() {
                                _loading = false;
                              });
                            }
                          });
              },
            ),
            Container(
              height: MediaQuery.of(context).size.height - 160.0,
              width: MediaQuery.of(context).size.width - 20.0,
              child: WebView(
                initialUrl: 'https://flutter.cn/',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
