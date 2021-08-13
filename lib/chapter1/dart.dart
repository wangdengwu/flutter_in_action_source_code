void main() {
  learnVar();
  learnDynamicObject();
  learnFinalConst();
  learnFunction();
  learnFuture();
  learnAsyncAwait();
  learnStream();
}

void learnVar() {
  var t = "learnVar";

  /// 下面代码在dart中会报错，因为变量t的类型已经确定为String，
  /// 类型一旦确定后则不能再更改其类型。
  ///   t = 1000;
  print(t);
}

void learnDynamicObject() {
  dynamic t = "learnDynamicObject 1";
  Object x = 'learnDynamicObject 2';

  ///下面代码没有问题
  t = 1000;
  x = 1000;
  print(t);
  print(x);

  dynamic a = "";
  Object b = "";

  ///正常打印
  print(a.length);

  ///编译错误
  // print(b.length);
}

void learnFinalConst() {
  final fStr = "hi world";
  const cStr = "hi world";

  /// 以下编译报错
  /// cStr = "hello world";
  /// fStr = "hello world";

  final fNow = DateTime.now();

  /// 以下编译报错
  /// const cNow = DateTime.now();
}

typedef bool CALLBACK(int num);

void learnFunction() {
  bool isOdd(int num) {
    return num.isOdd;
  }

  num(int num) {
    return num;
  }

  void test(CALLBACK cb) {
    print(cb(1));
  }

  ///编译报错，返回类型不匹配
  ///test(num);
  ///以下正常运行
  test(isOdd);

  bool oneLine(int num) => num.isOdd;
  test(oneLine);

  ///函数变量
  var say = (str) {
    print(str);
  };
  say("learnFunction 1");

  ///函数参数调用
  void execute(var callback) {
    callback();
  }

  execute(() => print("learnFunction 2"));

  ///可选参数
  String sayMsg(String from, String msg, [String? device]) {
    var result = '$from says $msg';
    if (device != null) {
      result = '$result with a $device';
    }
    return result;
  }

  print(sayMsg('Bob', 'Howdy')); //结果是： Bob says Howdy
  print(sayMsg(
      'Bob', 'Howdy', 'smoke signal')); //结果是：Bob says Howdy with a smoke signal

  /// 命名参数
  void enableFlags({bool bold: false, bool hidden: true}) {
    print(
      """
        bold is $bold,
        hidden is $hidden。
      """,
    );
  }

  enableFlags(bold: true, hidden: false);
  enableFlags(hidden: false);
  enableFlags();

  void enableFlagsRequired({required bool bold, bool hidden: true}) {
    print(
      """
        bold is $bold,
        hidden is $hidden。
      """,
    );
  }

  ///报错
  ///enableFlagsRequired();
  enableFlagsRequired(bold: false);
}

void learnFuture() {
  Future.delayed(new Duration(seconds: 2), () {
    return "learnFuture 1";
  }).then((data) {
    print(data);
  });

  Future.delayed(new Duration(seconds: 2), () {
    throw AssertionError("learnFuture error 1");
  }).then((data) {
    ///执行成功会走到这里
    print("success");
  }).catchError((e) {
    ///执行失败会走到这里
    print(e);
  });

  Future.delayed(new Duration(seconds: 2), () {
    throw AssertionError("learnFuture error 2");
  }).then((data) {
    print("success");
  }, onError: (e) {
    print(e);
  });

  Future.delayed(new Duration(seconds: 2), () {
    throw AssertionError("learnFuture error 3");
  }).then((data) {
    ///执行成功会走到这里
    print(data);
  }).catchError((e) {
    ///执行失败会走到这里
    print(e);
  }).whenComplete(() {
    ///无论成功或失败都会走到这里
    print("我一定会被执行");
  });

  Future.wait([
    /// 2秒后返回结果
    Future.delayed(new Duration(seconds: 1), () {
      return "learnFuture 2";
    }),

    /// 4秒后返回结果
    Future.delayed(new Duration(seconds: 2), () {
      return " learnFuture 3";
    })
  ]).then((results) {
    print(results[0] + results[1]);
  }).catchError((e) {
    print(e);
  });
}

void learnAsyncAwait() {
  ///先分别定义各个异步任务
  Future<String> login(String userName, String pwd) {
    ///用户登录
    return Future.delayed(new Duration(seconds: 2), () {
      return "login";
    });
  }

  Future<String> getUserInfo(String id) {
    ///获取用户信息
    return Future.delayed(new Duration(seconds: 2), () {
      return "userinfo";
    });
  }

  Future<String> saveUserInfo(String userInfo) {
    /// 保存用户信息
    return Future.delayed(new Duration(seconds: 2), () {
      return "save";
    });
  }

  login("alice", "******").then((login) {
    print(login);

    ///登录成功后通过，id获取用户信息
    getUserInfo(login).then((userInfo) {
      print(userInfo);

      ///获取用户信息后保存
      saveUserInfo(userInfo).then((save) {
        print(save);

        ///保存用户信息，接下来执行其它操作
      });
    });
  });

  ///使用Future消除Callback Hell
  login("alice", "******").then((login) {
    return getUserInfo(login);
  }).then((userInfo) {
    return saveUserInfo(userInfo);
  }).then((save) {
    ///执行接下来的操作
  }).catchError((e) {
    ///错误处理
    print(e);
  });

  ///使用async/await消除callback hell
  task() async {
    try {
      String id = await login("alice", "******");
      String userInfo = await getUserInfo(id);
      await saveUserInfo(userInfo);

      ///执行接下来的操作
    } catch (e) {
      ///错误处理
      print(e);
    }
  }

  task();
}

void learnStream() {
  Stream.fromFutures([
    // 1秒后返回结果
    Future.delayed(new Duration(seconds: 1), () {
      return "learnStream 1";
    }),
    // 抛出一个异常
    Future.delayed(new Duration(seconds: 2), () {
      throw AssertionError("learnStream error 2");
    }),
    // 3秒后返回结果
    Future.delayed(new Duration(seconds: 3), () {
      return "learnStream 3";
    })
  ]).listen(
    (data) => print(data),
    onError: (e) => print(e.message),
    onDone: () => {},
  );
}
