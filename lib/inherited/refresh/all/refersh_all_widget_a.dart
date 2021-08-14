import 'package:flutter/material.dart';

class RefreshAllWidgetA extends StatelessWidget {
  final int _mCount;

  const RefreshAllWidgetA(this._mCount, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("RefreshAll: WidgetA refresh");
    return Text("当前是：$_mCount",
        style: TextStyle(
          color: Colors.red,
          fontSize: 20
        ));
  }
}
