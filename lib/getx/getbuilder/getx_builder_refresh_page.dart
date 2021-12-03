import 'package:flutter/material.dart';

import 'getx_counter_builder_controller.dart';
import 'package:get/get.dart';

class GetXBuilderRefreshPage extends StatelessWidget {
  GetXBuilderRefreshPage({Key? key}) : super(key: key);

  GetXCounterBuilderController _controller = GetXCounterBuilderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetX Builder 刷新")),
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GetBuilder<GetXCounterBuilderController>(
              id: "counter1",
              init: _controller,
              initState: (state) {
                print("GetXBuilderRefreshPage GetX1 initState");
              },
              builder: (controller) {
                print("GetXBuilderRefreshPage GetX1 builder");
                return Text("计数器控件Text: ${controller.count1}");
              },
            ),
            GetBuilder<GetXCounterBuilderController>(
              id: "counter2",
              init: _controller,
              initState: (state) {
                print("GetXBuilderRefreshPage GetX2 initState");
              },
              builder: (controller) {
                print("GetXBuilderRefreshPage GetX2 builder");
                return Text("计数器控件Text: ${controller.count2}");
              },
            ),
            // Text("计数器控件Text: ${controller.count}"),
            MaterialButton(onPressed: () {
              _controller.add1();
              _controller.update(["counter1", "counter2"]);
            }, child: Icon(Icons.add)),
            MaterialButton(onPressed: () => _controller.add2(), child: Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}
