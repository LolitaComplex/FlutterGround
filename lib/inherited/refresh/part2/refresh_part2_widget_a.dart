import 'package:FlutterPlayground/inherited/refresh/part2/part_refresh_wrapper.dart';
import 'package:flutter/material.dart';

class RefreshPart2WidgetA extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    PartRefreshWrapperState? state = PartRefreshWrapper.of(context);

    print("RefreshPart2: WidgetA refresh");
    return Text("当前是：${state?.count}",
        style: TextStyle(
          color: Colors.red,
          fontSize: 20
        ));
  }
}
