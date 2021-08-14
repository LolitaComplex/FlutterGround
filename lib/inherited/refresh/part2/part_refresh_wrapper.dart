
import 'package:flutter/material.dart';

class PartRefreshWrapper extends StatefulWidget {

  final Widget child;

  const PartRefreshWrapper({Key key, this.child}) : super(key: key);

  @override
  PartRefreshWrapperState createState() => PartRefreshWrapperState();

  static PartRefreshWrapperState of(BuildContext context, {bool isRebuild = true}) {
    if (isRebuild) {
      return context.dependOnInheritedWidgetOfExactType<_InheritedWidget>().data;
    }
    return context.findAncestorWidgetOfExactType<_InheritedWidget>().data;
  }
}

class PartRefreshWrapperState extends State<PartRefreshWrapper> {

  int count = 0;

  void incrementCount() => setState(() => count++);

  @override
  Widget build(BuildContext context) {
    return new _InheritedWidget(child: widget.child, data: this);
  }
}

class _InheritedWidget extends InheritedWidget {

  final PartRefreshWrapperState _state;

  const _InheritedWidget({Key key, Widget child, PartRefreshWrapperState data}) :
        this._state = data,
        super(key: key, child: child);

  PartRefreshWrapperState get data => _state;


  @override
  bool updateShouldNotify(covariant _InheritedWidget oldWidget) {
    // return this._state.count != oldWidget._state.count;
    return true;
  }

}
