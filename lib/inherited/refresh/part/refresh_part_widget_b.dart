import 'package:flutter/material.dart';

class RefreshPartWidgetB extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print("RefreshPart: WidgetB refresh");
    return Text(
      "我是一个静态文本Widget",
      style: TextStyle(color: Colors.greenAccent, fontSize: 20),
    );
  }
}
