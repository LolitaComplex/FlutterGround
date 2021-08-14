import 'package:flutter/material.dart';

import 'refresh_part_widget_page.dart';

class RefreshPartWidgetA extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    RefreshPartWidgetPageState state = RefreshPartWidgetPage.of(context);

    print("RefreshPart: WidgetA refresh");
    return Text("当前是：${state.count}",
        style: TextStyle(
          color: Colors.red,
          fontSize: 20
        ));
  }
}
