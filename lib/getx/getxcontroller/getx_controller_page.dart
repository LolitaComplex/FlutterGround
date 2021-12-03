import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'getx_contorller_refresh_page.dart';
import 'getx_controller_refresh_list_page.dart';

class GetXControllerPage extends StatelessWidget {
  GetXControllerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetX Controller 刷新")),
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Column(
          children: [
            MaterialButton(child: Text("GetX Controller刷新") ,onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => GetXControllerRefreshPage()))),
            MaterialButton(child: Text("GetX Controller ListView刷新") ,onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => GetXControllerRefreshListPage()))),
          ],
        ),
      ),
    );
  }
}
