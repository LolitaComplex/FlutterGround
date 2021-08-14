import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("布局控件测试")),
      body: ListView(scrollDirection: Axis.vertical, children: [
        _buildOpacity(),
        _buildSpace(height: 15),
        _buildClipOval(),
        _buildSpace(height: 15),
        _buildClipRRect(),
        _buildSpace(height: 15),
        _buildPhysicalModel(),
        _buildSpace(height: 15),
        _buildPageView(),
        _buildSpace(height: 15),
        _buildFractionallySizeBox(),
      ]),
    );
  }

  Row _buildClipRRect() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("ClipRRect", style: TextStyle(fontSize: 18)),
        _buildSpace(width: 15),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.deepOrange,
          ),
        )
      ],
    );
  }

  SizedBox _buildSpace({int width = 0, int height = 0}) =>
      SizedBox(width: width.toDouble(), height: height.toDouble());

  Row _buildClipOval() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("ClipOval: ", style: TextStyle(fontSize: 18)),
        _buildSpace(width: 15),
        ClipOval(
          child: Container(
            width: 100,
            height: 100,
            color: Colors.purple,
          ),
        ),
      ],
    );
  }

  Widget _buildPhysicalModel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("PhysicalModel: ", style: TextStyle(fontSize: 18)),
        _buildSpace(width: 15),
        PhysicalModel(
          color: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.pink,
          ),
        ),
      ],
    );
  }

  Widget _buildOpacity() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Opacity: ", style: TextStyle(fontSize: 18)),
        _buildSpace(width: 15),
        Opacity(
            opacity: 0.1,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blueGrey,
            ))
      ],
    );
  }

  Widget _buildPageView() {
    List<Color> colors = [Colors.teal, Colors.tealAccent, Colors.indigo];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("ClipPageView: ", style: TextStyle(fontSize: 18)),
        _buildSpace(width: 15),
        SizedBox(
          width: 200,
          height: 100,
          child: PhysicalModel(
            color: Colors.transparent,
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(20.5),
            child: PageView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [Container(color: colors[index])],
                  );
                },
                itemCount: colors.length),
          ),
        )
      ],
    );
  }

  Widget _buildFractionallySizeBox() {
    return Column(
      children: [
        FractionallySizedBox(
          widthFactor: 1.0,
          child: Container(
              color: Colors.tealAccent,
              padding: EdgeInsets.all(10),
              child: Text("Container子元素撑满父布局")),
        ),
        Container(
            color: Colors.green,
            padding: EdgeInsets.all(10),
            child: Text("Container子元素居中不会撑满")),
      ],
    );
  }
}
