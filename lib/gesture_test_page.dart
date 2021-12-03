import 'package:flutter/material.dart';

class GestureTestPage extends StatefulWidget {
  const GestureTestPage({Key? key}) : super(key: key);

  @override
  _GestureTestPageState createState() => _GestureTestPageState();
}

class _GestureTestPageState extends State<GestureTestPage> {
  double _mMoveX = 0;
  double _mMoveY = 0;
  bool isFirstBuild = true;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    if (isFirstBuild) {
      _mMoveX = screenSize.width - 40;
      _mMoveY = screenSize.height - 40 - 100;
      isFirstBuild = false;
    }

    return Scaffold(
      appBar: AppBar(title: Text("点击事件测试页")),
      body: Container(
        color: Colors.blueGrey,
        child: FractionallySizedBox(
          widthFactor: 1,
          heightFactor: 1,
          child: Stack(
            children: [
              GestureDetector(
                onTap: () => print("onTab"),
                onDoubleTap: () => print("onDoubleTab"),
                onTapCancel: () => print("onTabCancel"),
                onLongPress: () => print("onLongPress"),
                onTapDown: (TapDownDetails details) =>
                    print("onTabDown: globalPosition: ${details.globalPosition}"
                        " localPosition: ${details.localPosition}"),
                onTapUp: (TapUpDetails details) =>
                    print("onTapUp: globalPosition: ${details.globalPosition}"
                        " localPosition: ${details.localPosition}"),
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.purple,
                ),
              ),
              Positioned(
                  left: _mMoveX,
                  top: _mMoveY,
                  child: GestureDetector(
                    onPanUpdate: (DragUpdateDetails detail) {
                      setState(() {
                        _mMoveX += detail.delta.dx;
                        _mMoveY += detail.delta.dy;
                      });
                    } ,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.teal),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
