import 'package:FlutterPlayground/getx/obx/gex_obx_part_refresh_text.dart';
import 'package:flutter/material.dart';

import 'getx_counter_controller.dart';
import 'package:get/get.dart';

class GetXControllerRefreshPage extends StatelessWidget {
  GetXControllerRefreshPage({Key key}) : super(key: key);

  GetXCounterController _controller = GetXCounterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetX Controller 刷新")),
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GetXObxPartRefreshText(),
            GetX<GetXCounterController>(
              init: _controller,
              initState: (state) {
                print("GetXControllerRefreshPage GetX1 initState");
              },
              builder: (controller) {
                print("GetXControllerRefreshPage GetX1 builder");
                return Text("计数器控件Text: ${controller.count1}");
              },
            ),
            GetX<GetXCounterController>(
              init: _controller,
              initState: (state) {
                print("GetXControllerRefreshPage GetX2 initState");
              },
              builder: (controller) {
                print("GetXControllerRefreshPage GetX2 builder");
                return Text("计数器控件Text: ${controller.count2}");
              },
            ),
            // Text("计数器控件Text: ${controller.count}"),
            RaisedButton(onPressed: () => _controller.add1(), child: Icon(Icons.add)),
            RaisedButton(onPressed: () => _controller.add2(), child: Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}
