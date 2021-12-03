import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../person_entity.dart';

class GetXObxRefreshListPage extends StatelessWidget {
  GetXObxRefreshListPage({Key? key}) : super(key: key);

  RxList<Rx<Person>> data = RxList.from(_buildPersonList());

  @override
  Widget build(BuildContext context) {
    print("GetXObxRefreshListPage refresh");
    return Scaffold(
      appBar: AppBar(title: Text("Obx刷新")),
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Obx(() => ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    print("GetXObxRefreshListPage ListView build item $index");
                    Rx<Person> person = data[index];
                    return Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() {
                            print("GetXObxRefreshListPage Refresh index:$index ${person.value.name}");
                            return Text(
                              person.value.name,
                              style:
                                  TextStyle(color: Colors.purple, fontSize: 20),
                            );
                          }),
                          Text(
                            " : ",
                            style: TextStyle(color: Colors.black, fontSize: 10),
                          ),
                          Obx(() {
                            print("GetXObxRefreshListPage Refresh index:$index ${person.value.age}");
                            return Text(
                              "${person.value.age}",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20),
                            );
                          })
                        ],
                      ),
                    );
                  },
                )),
            Positioned(
              bottom: 40,
              child: Column(
                children: [
                  MaterialButton(
                    onPressed: () {
                      var random = new Random();
                      var index = random.nextInt(data.length);
                      Rx<Person> person = data[index];
                      int newAge = person.value.age * 2 + 1;
                      person.value = Person(person.value.name, newAge);
                    },
                    child: Text("更新某个Item"),
                  ),
                  SizedBox(height: 10),
                  MaterialButton(
                      onPressed: () {
                        Person person =
                            new Person("新增Item", data.length * 2 + 1);
                        data.add(person.obs);
                      },
                      child: Text("新增一个Item")),
                  SizedBox(height: 10),
                  MaterialButton(
                      onPressed: () {
                        data.removeAt(data.length ~/ 2);
                      },
                      child: Text("删除一个Item")),
                  SizedBox(height: 10),
                  MaterialButton(
                      onPressed: () {
                        var item = data.removeAt(data.length ~/ 2);
                        data.insert(0, item);
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

  static List<Rx<Person>> _buildPersonList() {
    List<Rx<Person>> list = <Rx<Person>>[];
    for (int x = 0; x < 10; x++) {
      list.add(Person("Obx测试 $x", x).obs);
    }
    return list;
  }
}


