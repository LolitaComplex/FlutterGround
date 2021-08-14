import 'package:FlutterPlayground/inherited/refresh/all/refresh_all_widget_page.dart';
import 'package:FlutterPlayground/inherited/refresh/part/refresh_part_widget_page.dart';
import 'package:FlutterPlayground/inherited/refresh/part2/refresh_part2_widget_page.dart';
import 'package:flutter/material.dart';


/// 例子博客地址： https://blog.csdn.net/vitaviva/article/details/105462686
class InheritedRefreshPartPage extends StatefulWidget {
  const InheritedRefreshPartPage({Key key}) : super(key: key);

  @override
  _InheritedRefreshPartPageState createState() => _InheritedRefreshPartPageState();
}

class _InheritedRefreshPartPageState extends State<InheritedRefreshPartPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inherited局部刷新测试页面")),
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Column(
          children: [
            _buildRaisedButton("全部刷新", () => Navigator.push(context, MaterialPageRoute(builder:
                (context) => RefreshAllWidgetPage()))),
            _buildRaisedButton("局部刷新", () => Navigator.push(context, MaterialPageRoute(builder:
                (context) => RefreshPartWidgetPage()))),
            _buildRaisedButton("局部刷新2", () => Navigator.push(context, MaterialPageRoute(builder:
                (context) => RefreshPart2WidgetPage())))
          ],
        ),
      ),
    );
  }

  MaterialButton _buildRaisedButton(String text, VoidCallback callback) {
    return RaisedButton(
        onPressed: callback,
        child: Text(text)
    );
  }
}
