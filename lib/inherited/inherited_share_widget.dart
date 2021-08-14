import 'package:flutter/material.dart';

class InheritedShareWidget<T> extends InheritedWidget {

  final T data;

  const InheritedShareWidget({@required this.data, Widget child})
      : super(child: child);

  static InheritedShareWidget of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<InheritedShareWidget>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    print("--- InheritedShareWidget: updateShouldNotify ---}");
    return true;
  }

}