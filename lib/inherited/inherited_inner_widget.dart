import 'package:FlutterPlayground/inherited/inherited_share_widget.dart';
import 'package:FlutterPlayground/inherited/inherited_test_entity.dart';
import 'package:flutter/material.dart';

class InheritedInnerWidget extends StatefulWidget {
  final InheritedTestEntity _data;
  const InheritedInnerWidget(this._data, {Key? key}) : super(key: key);

  @override
  _InheritedInnerWidgetState createState() => _InheritedInnerWidgetState();
}

class _InheritedInnerWidgetState extends State<InheritedInnerWidget> {

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    print("--- InheritedInnerWidget: build ---");
    return Column(
      children: [
        Text(getShareText()),
        Container(
          margin: EdgeInsets.only(top: 15),
          child: MaterialButton(
              child: Text("Inner刷新"),
              onPressed: () => setState(() {
                widget._data.fromInnerPage = _count++;
              })
          ),
        ),
      ],
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("--- InheritedInnerWidget: didChangeDependencies ---");
  }

  String getShareText() {
    var data = InheritedShareWidget.of(context)?.data as InheritedTestEntity;
    return "Inner: ${data.currentOuterPage}";
  }
}
