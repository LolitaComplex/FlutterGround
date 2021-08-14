import 'package:flutter/material.dart';

class RefreshPart2WidgetB extends StatefulWidget {
  const RefreshPart2WidgetB({Key key}) : super(key: key);

  @override
  _RefreshPart2WidgetBState createState() => _RefreshPart2WidgetBState();
}

class _RefreshPart2WidgetBState extends State<RefreshPart2WidgetB> {
  @override
  Widget build(BuildContext context) {
    print("RefreshPart2: WidgetB refresh");
    return Text(
      "我是一个静态文本Widget",
      style: TextStyle(color: Colors.greenAccent, fontSize: 20),
    );
  }
}
