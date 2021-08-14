import 'package:FlutterPlayground/getx/getxcontroller/getx_controller_page.dart';
import 'package:FlutterPlayground/getx/obx/getx_obx_page.dart';
import 'package:FlutterPlayground/getx/obx/getx_obx_refresh_page.dart';
import 'package:flutter/material.dart';

class GetXRefreshPage extends StatelessWidget {
  const GetXRefreshPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetX刷新测试页面")),
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Column(
          children: [
            RaisedButton(child: Text("Obx刷新") ,onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => GetXObxPage()))),
            RaisedButton(child: Text("GetX Controller 刷新") ,onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => GetXControllerPage())))
          ],
        ),
      ),
    );
  }
}