import 'package:FlutterPlayground/inherited/inherited_inner_widget.dart';
import 'package:FlutterPlayground/inherited/inherited_share_widget.dart';
import 'package:FlutterPlayground/inherited/inherited_test_entity.dart';
import 'package:flutter/material.dart';

class InheritedTestPage extends StatefulWidget {
  const InheritedTestPage({Key key}) : super(key: key);

  @override
  _InheritedTestPageState createState() => _InheritedTestPageState();
}

class _InheritedTestPageState extends State<InheritedTestPage> {
  InheritedTestEntity entity = new InheritedTestEntity();
  int _count = 0;

  @override
  Widget build(BuildContext context) {

    print("--- InheritedOuterWidget: build ---");
    return Scaffold(
      appBar: AppBar(title: Text("Inherited测试页")),
      body: InheritedShareWidget(
        data: entity,
        child: FractionallySizedBox(
          widthFactor: 1,
          child: Column(
            children: [
              Text(getShareText()),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: RaisedButton(
                    child: Text("Outer刷新"),
                    onPressed: () => setState(() {
                      entity = InheritedTestEntity.clone(entity);
                      entity.fromOuterPage = _count++;
                    })
                )
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: InheritedInnerWidget(entity),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("--- InheritedOuterWidget: didChangeDependencies ---");
  }

  String getShareText() {
    return "Outer: $_count";
  }
}
