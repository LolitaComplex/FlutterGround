import 'package:flutter/material.dart';

import 'getx_obx_refresh_list_page.dart';
import 'getx_obx_refresh_page.dart';

class GetXObxPage extends StatelessWidget {
  const GetXObxPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Obx刷新")),
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Column(
          children: [
            RaisedButton(child: Text("Obx刷新") ,onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => GetXObxRefreshPage()))),
            RaisedButton(child: Text("Obx ListView刷新") ,onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => GetXObxRefreshListPage()))),
          ],
        ),
      ),
    );
  }
}
