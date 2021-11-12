import 'package:get/get.dart';
import '../person_entity.dart';

class GetXCounterBuilderController extends GetxController {

  // final RxList<Rx<Person>> _data = List<Rx<Person>>().obs;
  // RxInt _status = 0.obs;
  //
  // RxList<Rx<Person>> get data => _data;
  // int get status => _status.value;

  int _counter1 = 0;
  int _counter2 = 0;
  int get count1 => _counter1;
  int get count2 => _counter2;

  void add1() {
    _counter1++;
  }

  void add2() {
    _counter2++;
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