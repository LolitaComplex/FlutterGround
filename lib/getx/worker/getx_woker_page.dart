import 'package:FlutterPlayground/getx/worker/getx_woker_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXWorkerPage extends StatefulWidget {
  const GetXWorkerPage({Key? key}) : super(key: key);

  @override
  _GetXWorkerPageState createState() => _GetXWorkerPageState();
}

class _GetXWorkerPageState extends State<GetXWorkerPage> {

  GetXWorkerController _controller = new GetXWorkerController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Worker Test")),
      body: FractionallySizedBox(
        widthFactor: 1,
        child: GetX<GetXWorkerController>(
          init: _controller,
          builder: (controller) {
            return Column(
              children: [
                Text("计数器: ${controller.count}"),
                SizedBox(height: 10,),
                MaterialButton(onPressed: () {
                  controller.add();
                }, child: Icon(Icons.add),)
              ],
            );
          },
        )
      ),
    );
  }
}
