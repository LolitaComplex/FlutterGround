import 'dart:math';

import 'package:FlutterPlayground/getx/getxcontroller/getx_counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../person_entity.dart';

class GetXControllerRefreshListPage extends StatefulWidget {
  GetXControllerRefreshListPage({Key? key}) : super(key: key);

  @override
  _GetXControllerRefreshListPageState createState() => _GetXControllerRefreshListPageState();
}

class _GetXControllerRefreshListPageState extends State<GetXControllerRefreshListPage> {
  GetXCounterController _controller = new GetXCounterController();

  @override
  void initState() {
    super.initState();
    _controller.init();
  }

  @override
  Widget build(BuildContext context) {
    print("GetXControllerRefreshListPage refresh");
    return Scaffold(
      appBar: AppBar(title: Text("Obx刷新")),
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Stack(
          alignment: Alignment.center,
          children: [
            GetX<GetXCounterController>(
              init: _controller,
              initState: (state) {
                print("GetXControllerRefreshListPage GetXList state: ${state == this} "
                    "${state.toStringShort()}");
              },
              builder: (controller) => _buildContentWidget(controller),
            ),
            Positioned(
              bottom: 40,
              child: Column(
                children: [
                  MaterialButton(
                    onPressed: () {
                      var random = new Random();
                      var index = random.nextInt(_controller.data.length);
                      Rx<Person> person = _controller.data[index];
                      int newAge = person.value.age * 2 + 1;
                      person.value = Person(person.value.name, newAge);
                    },
                    child: Text("更新某个Item"),
                  ),
                  SizedBox(height: 10),
                  MaterialButton(
                      onPressed: () {
                        Person person = new Person("新增Item", _controller.data.length * 2 + 1);
                        _controller.data.add(person.obs);
                      },
                      child: Text("新增一个Item")),
                  SizedBox(height: 10),
                  MaterialButton(
                      onPressed: () {
                        _controller.data.removeAt(_controller.data.length ~/ 2);
                      },
                      child: Text("删除一个Item")),
                  SizedBox(height: 10),
                  MaterialButton(
                      onPressed: () {
                        var item = _controller.data.removeAt(_controller.data.length ~/ 2);
                        _controller.data.insert(0, item);
                      },
                      child: Text("修改两个Item位置"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildContentWidget(GetXCounterController controller) {
    if (_controller.status == 0) {
      return Center(
        child: Text("Loading...")
      );
    }

    return ListView.builder(
      itemCount: controller.data.length,
      itemBuilder: (BuildContext context, int index) {
        print("GetXControllerRefreshListPage GetXList build item $index");
        Rx<Person> person = controller.data[index];
        return Container(
          margin: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetX<GetXCounterController>(
                init: _controller,
                initState: (state) {
                  print("GetXControllerRefreshListPage GetXList state refresh Item1: ${state == this} "
                      "${state.toStringShort()}");
                },
                builder: (controller) {
                  print("GetXControllerRefreshListPage GetXList Refresh index:$index ${person.value.name}");
                  return Text(
                    person.value.name,
                    style:
                    TextStyle(color: Colors.purple, fontSize: 20),
                  );
                },
              ),
              Text(
                " : ",
                style: TextStyle(color: Colors.black, fontSize: 10),
              ),
              GetX<GetXCounterController>(
                init: _controller,
                initState: (state) {
                  print("GetXControllerRefreshListPage GetXList state refresh Item2: ${state == this} "
                      "${state.toStringShort()}");
                },
                builder: (controller) {
                  print("GetXControllerRefreshListPage GetXList Refresh index:$index ${person.value.age}");
                  return Text(
                    "${person.value.age}",
                    style:
                    TextStyle(color: Colors.green, fontSize: 20),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
