import 'dart:async';

class Test {

  bool test() {
    Future.delayed(Duration(seconds: 1))
        .then((value) {

    }).onError((error, stackTrace) {

    }).catchError((e) {

    }).whenComplete(() => null)
        .timeout(Duration(seconds: 10));

    final completer = Completer<String>();
    completer.complete("");
    completer.completeError(new Error());
    final futureComplete = completer.future;
    final futureWait = Future.wait([
      //...
    ]);

    Future.value(1);
    final streamFutures = Stream.fromFutures([

    ]).listen((event) {

    }, onError: (e) {

    }).onDone(() {

    });


    final streamFuture = Future.value(1).asStream();

    final controller = new StreamController<String>();
    controller.sink.add("test1");
    controller.sink.add("test2");
    controller.sink.close();
    controller.stream;
    return true;
  }

  void async() async {
    try {
      String result1 = await Completer<String>().future;
      String result2 = await Completer<String>().future;
    } catch (e) {
      print(e);
    } finally {
    }
  }

  void asyncStream() async {
    await for (final value in new StreamController<String>().stream) {
      // do something
    }
  }


}