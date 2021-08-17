import 'package:flutter/material.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({Key? key}) : super(key: key);

  @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body: Center(
        child: NotificationListener<MyNotification>(
          onNotification: (notification) {
            setState(() {
              _counter += notification.addend;
            });
            return true;
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                "$_counter",
                style: Theme.of(context).textTheme.headline4,
              ),
              Builder(builder: (context) {
                return CircleAvatar(
                  child: IconButton(
                    onPressed: () {
                      MyNotification(2).dispatch(context);
                    },
                    icon: Icon(Icons.add),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class MyNotification extends Notification {
  MyNotification(this.addend);

  final int addend;
}
