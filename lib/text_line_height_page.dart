import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextlineHeightPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container Study"),
      ),
      backgroundColor: Colors.black,
      body: Container(
        color: Colors.lime,
        alignment: Alignment.center,
        child: Container(
            alignment: Alignment.center,
            child: Container(
              height: 200,
              color: Colors.purple,
              alignment: Alignment.center,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.blue,
                    child: new Text(
                      "Hg",
                      style: TextStyle(
                        fontSize: 50,
                      ),
                      strutStyle: StrutStyle(
                          forceStrutHeight: true,
                          fontSize: 50,
                          height: 1,
                          leading: 1),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
