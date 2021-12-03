import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'gex_obx_part_refresh_text.dart';

class GetXObxRefreshPage extends StatelessWidget {
  GetXObxRefreshPage({Key? key}) : super(key: key);

  final RxInt counter1 = 0.obs;
  final RxInt counter2 = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Obx刷新")),
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GetXObxPartRefreshText(),
            Obx(() {
              print("Refresh Obx counter1 part");
              return Text("计数器控件Text: ${counter1.value}");
            }),
            Obx(() {
              print("Refresh Obx counter2 part");
              return Text("计数器控件Text: ${counter2.value}");
            }),
            Obx(() {
              print("Refresh Obx DefaultText part");
              return Text("Obx 默认Text ${"a".obs}");
            }), // 默认会崩溃，必须使用响应数据类型
            MaterialButton(onPressed: () => counter1.value++, child: Icon(Icons.add)),
            MaterialButton(onPressed: () => counter2.value++, child: Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}
