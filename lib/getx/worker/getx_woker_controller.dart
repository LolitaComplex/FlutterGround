import 'package:get/get.dart';

class GetXWorkerController extends GetxController {

  RxInt _counter = 0.obs;

  int get count => _counter.value;

  void add() {
    _counter.value++;
  }

  @override
  void onInit() {
    print("GetXWorker controller onInit}");
    super.onInit();

    once(_counter, (value) {
      print("GetXWorker once: $value}");
    });

    ever(_counter, (value) {
      print("GetXWorker ever: $value}");
    });

    everAll([_counter], (value) {
      print("GetXWorker everAll: $value}");
    });

    debounce(_counter, (value) {
      print("GetXWorker debounce: $value}");
    }, time: Duration(seconds: 2));

    interval(_counter, (value) {
      print("GetXWorker interval: $value}");
    }, time: Duration(seconds: 2));
  }

  @override
  void onReady() {
    print("GetXWorker controller onReady");
    super.onReady();
  }

  @override
  void onClose() {
    print("GetXWorker controller onClose");
    super.onClose();
  }

}