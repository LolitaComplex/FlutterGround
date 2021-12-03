import 'package:flutter/material.dart';

import 'refersh_all_widget_a.dart';
import 'refersh_all_widget_b.dart';
import 'refersh_all_widget_c.dart';

class RefreshAllWidgetPage extends StatefulWidget {
  const RefreshAllWidgetPage({Key? key}) : super(key: key);

  @override
  _RefreshAllWidgetPageState createState() => _RefreshAllWidgetPageState();
}

class _RefreshAllWidgetPageState extends State<RefreshAllWidgetPage> {

  int _mCount = 0;

  void _incrementCounter() => setState(() => _mCount++);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("全部刷新")),
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RefreshAllWidgetA(_mCount),
            RefreshAllWidgetB(),
            RefreshAllWidgetC(_incrementCounter),
          ],
        ),
      ),
    );
  }
}
