import 'package:FlutterPlayground/inherited/refresh/part2/part_refresh_wrapper.dart';
import 'package:flutter/material.dart';

import 'refresh_part2_widget_a.dart';
import 'refresh_part2_widget_b.dart';
import 'refresh_part2_widget_c.dart';

class RefreshPart2WidgetPage extends StatefulWidget {
  const RefreshPart2WidgetPage({Key? key}) : super(key: key);

  @override
  RefreshPart2WidgetPageState createState() => RefreshPart2WidgetPageState();
}

class RefreshPart2WidgetPageState extends State<RefreshPart2WidgetPage> {

  @override
  Widget build(BuildContext context) {
    return PartRefreshWrapper(
      child: Scaffold(
        appBar: AppBar(title: Text("局部刷新")),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RefreshPart2WidgetA(),
              RefreshPart2WidgetB(),
              RefreshPart2WidgetC(),
            ],
          ),
        ),
      ),
    );
  }
}
