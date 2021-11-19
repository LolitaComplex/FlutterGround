import 'package:FlutterPlayground/assets/assets_image_page.dart';
import 'package:FlutterPlayground/blur_test_page.dart';
import 'package:FlutterPlayground/inherited/inherited_test_page.dart';
import 'package:FlutterPlayground/layout_test_page.dart';
import 'package:FlutterPlayground/lifecycle_test_page.dart';
import 'package:FlutterPlayground/router_constant.dart';
import 'package:FlutterPlayground/stateful_widget_page.dart';
import 'package:FlutterPlayground/text_line_height_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_life_cycle/page_life_cycle.dart';

import 'gesture_test_page.dart';
import 'getx/getx_refresh_page.dart';
import 'inherited/refresh/inherited_refresh_part_page.dart';
import 'state_less_widget_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Brightness _mCurrentBrightness = Brightness.light;

  Map<String, WidgetBuilder> routes =  <String, WidgetBuilder>{
    RouterConstant.STATELESS_PAGE: (BuildContext context) => StatelessWidgetPage(),
    RouterConstant.STATEFULL_PAGE: (BuildContext context) => StatefulWidgetPage(),
    RouterConstant.TEXT_LINE_HEIGHT_PAGE: (BuildContext context) => TextlineHeightPage(),
    RouterConstant.BLUR_TEST_PAGE: (BuildContext context) => BlurTestPage(),
    RouterConstant.LAYOUT_TEST_PAGE: (BuildContext context) => LayoutTestPage(),
    RouterConstant.GESTURE_TEST_PAGE: (BuildContext context) => GestureTestPage(),
    RouterConstant.LIFECYCLE_TEST_PAGE: (BuildContext context) => LifecycleTestPage(),
    RouterConstant.INHERITED_TEST_PAGE: (BuildContext context) => InheritedTestPage(),
    RouterConstant.INHERITED_REFRESH_PART: (BuildContext context) => InheritedRefreshPartPage(),
    RouterConstant.GEX_REFRESH_PAGE: (BuildContext context) => GetXRefreshPage(),
    RouterConstant.ASSETS_IMAGE_PAGE: (BuildContext context) => AssetsImagePage(),
  };


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: _mCurrentBrightness,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        navigatorObservers: [PageNavigatorObserver()],
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (BuildContext context) =>
              routes[settings.name].call(context));
        },
        // routes: routes,
        home: HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    var data = rootBundle.loadString("assets/configs/config.json");
    print("Doing Home data: $data");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FlutterPlayground")),
      body: _buildBodyWidget(),
    );
  }

  Widget _buildBodyWidget() {
    List<Widget> buttons = new List<Widget>();
    buttons.add(_buildBrightnessSwitch());
    buttons.add(_buildRaisedButton("StatelessPage", () => goToTargetPage(RouterConstant.STATELESS_PAGE)));
    buttons.add(_buildRaisedButton("StatefulPage", () => goToTargetPage(RouterConstant.STATEFULL_PAGE)));
    buttons.add(_buildRaisedButton("Text行高测试", () => goToTargetPage(RouterConstant.TEXT_LINE_HEIGHT_PAGE)));
    buttons.add(_buildRaisedButton("高斯模糊测试", () => goToTargetPage(RouterConstant.BLUR_TEST_PAGE)));
    buttons.add(_buildRaisedButton("布局控件测试", () => goToTargetPage(RouterConstant.LAYOUT_TEST_PAGE)));
    buttons.add(_buildRaisedButton("点击事件相关测试", () => goToTargetPage(RouterConstant.GESTURE_TEST_PAGE)));
    buttons.add(_buildRaisedButton("页面生命周期相关测试", () => goToTargetPage(RouterConstant.LIFECYCLE_TEST_PAGE)));
    buttons.add(_buildRaisedButton("Inherited数据共享", () => goToTargetPage(RouterConstant.INHERITED_TEST_PAGE)));
    buttons.add(_buildRaisedButton("Inherited局部更新", () => goToTargetPage(RouterConstant.INHERITED_REFRESH_PART)));
    buttons.add(_buildRaisedButton("GetX更新", () => goToTargetPage(RouterConstant.GEX_REFRESH_PAGE)));
    buttons.add(_buildRaisedButton("AssetsImage", () => goToTargetPage(RouterConstant.ASSETS_IMAGE_PAGE)));

    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: buttons,
      ),
    );
  }

  MaterialButton _buildRaisedButton(String text, VoidCallback callback) {
    return RaisedButton(
        onPressed: callback,
        child: Text(text)
    );
  }

  void goToTargetPage(String routerName) {
    Navigator.pushNamed(context, routerName);
    // Navigator.push(context,  MaterialPageRoute(builder: (BuildContext context) {
    //   return StatefulWidgetPage();
    // }));
  }

  Widget _buildBrightnessSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("夜间模式: "),
        // Switch(value: _mCurrentBrightness == Brightness.dark, onChanged: (bool isSelect) =>
        //   setState(() {
        //     _mCurrentBrightness = isSelect ? Brightness.dark : Brightness.light;
        //   })
        // )
      ],
    );
  }
}




