import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlurTestPage extends StatefulWidget {
  const BlurTestPage({Key key}) : super(key: key);

  @override
  _BlurTestPageState createState() => _BlurTestPageState();
}

class _BlurTestPageState extends State<BlurTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("高斯模糊测试")),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.8),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return _buildContent();
            },
          ),
        )
    );
  }

  Widget _buildContent() {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 300,
            height: 300,
            color: Colors.yellow,
            alignment: Alignment.topCenter,
            child: Text("测试文本"),
          ),
          ClipRect(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Center(
                  child: Container(
                    color: Colors.red,
                    width: 200,
                    height: 200,
                  ),
                )),
          ),
          Container(
            width: 50,
            height: 50,
            color: Colors.green,
          )
        ],
      ),
    );
  }
}


// https://wiki.inkept.cn/pages/viewpage.action?pageId=169955739#id-%E7%94%A8%E6%88%B7%E6%9C%8D%E5%8A%A1%E6%96%87%E6%A1%A3-im%E4%BC%9A%E8%AF%9Dextra.targetRole%E5%8F%96%E5%80%BC