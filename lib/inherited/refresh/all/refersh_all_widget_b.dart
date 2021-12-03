import 'package:flutter/material.dart';

class RefreshAllWidgetB extends StatelessWidget {
  const RefreshAllWidgetB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("RefreshAll: WidgetB refresh");
    return Text(
      "我是一个静态文本Widget",
      style: TextStyle(color: Colors.greenAccent, fontSize: 20),
    );
  }
}
