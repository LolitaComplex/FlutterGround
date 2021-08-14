import 'package:FlutterPlayground/router_constant.dart';
import 'package:flutter/material.dart';
import 'package:page_life_cycle/page_life_cycle.dart';

class LifecycleTestPage extends StatefulWidget {
  const LifecycleTestPage({Key key}) : super(key: key);

  @override
  _LifecycleTestPageState createState() {
    print("------createState------");
    return _LifecycleTestPageState();
  }
}

class _LifecycleTestPageState extends State<LifecycleTestPage>
    with WidgetsBindingObserver, PageLifeCycle {

  @override
  void initState() {
    super.initState();
    print("------initState------");
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    print("------build------");
    return Scaffold(
      appBar: AppBar(title: Text("生命周期相关")),
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 15),
              child: RaisedButton(child: Text("刷新"),
                  onPressed: () => setState(() {})),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 15),
              child: RaisedButton(child: Text("下一页"),
                  onPressed: () => Navigator.pushNamed(context, RouterConstant.STATEFULL_PAGE)),
            )
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("------didChangeDependencies------");
  }

  @override
  void didUpdateWidget(covariant LifecycleTestPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("------didUpdateWidget------");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        print("WidgetBinding: AppForeground");
        break;
      case AppLifecycleState.inactive:
      // 不常用：应用处于后台，来了个电话
        print("WidgetBinding: inactive");
        break;
      case AppLifecycleState.paused:
        print("WidgetBinding: AppBackground");
        break;
      case AppLifecycleState.detached:
      // 不常用: 应用被挂起时使用，不会再IOS上触发
        print("WidgetBinding: inactive");
        break;
    }
  }

  @override
  void deactivate() {
    super.deactivate();
    print("------deactivate------");
  }

  @override
  void dispose() {
    super.dispose();
    print("------dispose------");
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void onShow() {
    super.onShow();
    print("---PageLifeCycle onShow---");
  }

  @override
  void onHide() {
    super.onHide();
    print("---PageLifeCycle onHide---");
  }

  @override
  void onAppBackground() {
    super.onAppBackground();
    print("---PageLifeCycle onAppBackground---");
  }

  @override
  void onAppForeground() {
    super.onAppForeground();
    print("---PageLifeCycle onAppForeground---");
  }
}
