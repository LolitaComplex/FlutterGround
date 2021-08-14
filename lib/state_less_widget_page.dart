import 'package:flutter/material.dart';

const IMAGE_URL =
    "https://img2.baidu.com/it/u=2676105470,3716419393&fm=26&fmt=auto&gp=0.jpg";

class StatelessWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container Study"),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                // color: Colors.pink,
                  foregroundDecoration:
                  BoxDecoration(color: Colors.transparent),
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      shape: BoxShape.rectangle,
                      border: Border.all(
                          color: Colors.red,
                          width: 3.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(50.0),
                      gradient:
                      LinearGradient(colors: [Colors.blue, Colors.pink]),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            // spreadRadius: 10.0,
                            blurRadius: 10.0,
                            offset: Offset.zero)
                      ],
                      image: DecorationImage(
                          image: NetworkImage(IMAGE_URL),
                          fit: BoxFit.cover,
                          scale: 10.0)),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  constraints:
                  BoxConstraints.tightForFinite(width: 300, height: 300),
                  alignment: Alignment.center,
                  clipBehavior: Clip.hardEdge),
              Container(
                height: 150,
                color: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text(
                      "HgHg",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      strutStyle: StrutStyle(
                          forceStrutHeight: true,
                          fontSize: 20,
                          height: 1,
                          leading: 1),
                    ),
                    Text(
                      "HgHg",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.add_to_queue,
                  size: 30, color: Colors.deepOrangeAccent),
              CloseButton(
                color: Colors.deepPurple,
                onPressed: () {},
              ),
              BackButton(
                color: Colors.deepPurple,
                onPressed: () {},
              ),
              Chip(
                label: Text("Chip控件"),
                padding: EdgeInsets.symmetric(horizontal: 30),
              ),
              Divider(
                  height: 1,
                  color: Colors.deepOrange,
                  thickness: 10.0,
                  indent: 10.0,
                  endIndent: 10.0),
              Card(
                color: Colors.greenAccent,
                elevation: 10,
                shadowColor: Colors.cyan,
                clipBehavior: Clip.antiAlias,
                borderOnForeground: false,
                margin: EdgeInsets.all(10.0),
                child: Container(
                  width: 100,
                  height: 100,
                ),
              ),
              AlertDialog(
                title: Text("弹框标题"),
                content: Text("弹框内容~"),
              )
            ],
          ),
        ],
      ),
    );
  }

}