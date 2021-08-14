import 'package:flutter/material.dart';

class RefreshAllWidgetC extends StatelessWidget {

  final VoidCallback _mCallback;

  const RefreshAllWidgetC(this._mCallback, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("RefreshAll: WidgetC refresh");
    return RaisedButton(onPressed: _mCallback,
      child: Icon(Icons.add),
    );
  }
}

