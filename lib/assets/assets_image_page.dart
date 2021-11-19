import 'package:flutter/material.dart';

class AssetsImagePage extends StatelessWidget {
  const AssetsImagePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getData(context);

    return Scaffold(
      appBar: AppBar(title: Text("AssetsImagePage")),
      body: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/ic_test4.png",
                package: ""),
            Container(
              decoration: BoxDecoration(
                image: new DecorationImage(
                    image: AssetImage("assets/images/ic_test3.png")),
              ),
            )
          ],
        ),
      ),
    );
  }

  void getData(BuildContext context) async {
    var data = await DefaultAssetBundle.of(context)
        .loadString("assets/configs/config.json");
    print("Doing get configs: $data");
  }
}
