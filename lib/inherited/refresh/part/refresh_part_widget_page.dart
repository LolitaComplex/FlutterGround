import 'package:flutter/material.dart';

import 'refresh_part_widget_a.dart';
import 'refresh_part_widget_b.dart';
import 'refresh_part_widget_c.dart';

class RefreshPartWidgetPage extends StatefulWidget {
  const RefreshPartWidgetPage({Key key}) : super(key: key);

  @override
  RefreshPartWidgetPageState createState() => RefreshPartWidgetPageState();

  static RefreshPartWidgetPageState of(BuildContext context,
      {bool rebuild = true}) {
    return context.dependOnInheritedWidgetOfExactType<_RefreshPartInheritedWidget>().data;

    // if (rebuild) {
    //   return (context.inheritFromWidgetOfExactType(_RefreshPartInheritedWidget)
    //   as _RefreshPartInheritedWidget).data;
    // }
    // return (context.ancestorWidgetOfExactType(_RefreshPartInheritedWidget) as
    // _RefreshPartInheritedWidget).data;
  }
}

class RefreshPartWidgetPageState extends State<RefreshPartWidgetPage> {

  int count = 0;

  void incrementCount() => setState(() => count++);

  @override
  Widget build(BuildContext context) {
    return _RefreshPartInheritedWidget(
      data: this,
      child: Scaffold(
        appBar: AppBar(title: Text("局部刷新")),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RefreshPartWidgetA(),
              RefreshPartWidgetB(),
              RefreshPartWidgetC(),
            ],
          ),
        ),
      )
    );
  }
}

class _RefreshPartInheritedWidget extends InheritedWidget {

  final RefreshPartWidgetPageState _mData;

  RefreshPartWidgetPageState get data => _mData;

  const _RefreshPartInheritedWidget({Key key, Widget child,
    RefreshPartWidgetPageState data})
      : this._mData = data,
        super(key: key, child: child);

  // 是否会通知
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

}
