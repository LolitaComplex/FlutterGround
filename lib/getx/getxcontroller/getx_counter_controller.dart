import 'package:get/get.dart';
import '../person_entity.dart';

class GetXCounterController extends GetxController {

  final RxList<Rx<Person>> _data = <Rx<Person>>[].obs;
  RxInt _status = 0.obs;

  RxList<Rx<Person>> get data => _data;
  int get status => _status.value;

  final RxInt _counter1 = 0.obs;
  final RxInt _counter2 = 0.obs;
  int get count1 => _counter1.value;
  int get count2 => _counter2.value;

  void init() {
    for (int x = 0; x < 10; x++) {
      _data.add(Person("Controller Item", x).obs);
    }

    Future.delayed(new Duration(seconds: 3), () {
      for (int x = 0; x < 10; x++) {
        _data.add(Person("Controller Delay Item", x).obs);
      }
      _status.value = 1;
    });
  }

  void add1() {
    _counter1.value++;
  }

  void add2() {
    _counter2.value++;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}