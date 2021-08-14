import 'package:flutter/material.dart';
class GetXBuilderPage extends StatelessWidget {
  GetXBuilderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetX Controller 刷新")),
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Column(
          children: [
            // RaisedButton(child: Text("GetX Controller刷新") ,onPressed: () => Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => GetXControllerRefreshPage()))),
            // RaisedButton(child: Text("GetX Controller ListView刷新") ,onPressed: () => Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => GetXControllerRefreshListPage()))),
          ],
        ),
      ),
    );
  }
}

class Person {}
