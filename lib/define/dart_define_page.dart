import 'package:flutter/material.dart';

class DartDefinePage extends StatefulWidget {
  const DartDefinePage({Key? key}) : super(key: key);

  @override
  _DartDefinePageState createState() => _DartDefinePageState();
}

class _DartDefinePageState extends State<DartDefinePage> {

  static const String defineParam1 = String.fromEnvironment("DART_DEFINE_APP_ENV");
  final String defineParam2 = String.fromEnvironment("DART_DEFINE_APP_ENV");

  @override
  void initState() {
    super.initState();
    print("Doing show define: $defineParam1  $defineParam2");
    final constTest = new ConstTest.test("啦啦啦");
    print("ConstTest: $constTest");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DartDefine测试页")),
      body: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Text("参数: $defineParam1 $defineParam2")
          ],
        ),
      ),
    );
  }
}

class ConstTest {

  external const factory ConstTest.test(String name);

}
