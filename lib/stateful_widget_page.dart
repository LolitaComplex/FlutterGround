import 'package:flutter/material.dart';

const IMAGE_TWO_URL =
    "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fp6."
    "itc.cn%2Fimages01%2F20200526%2F63f8a6ed4e9b4f7fb2a6cdabb60298b0.jpeg&refer=http"
    "%3A%2F%2Fp6.itc.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1629461586&t=c348f3c1e77569a69b479f125294211a";

class StatefulWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _StatefulWidgetPageState();
  }
}

class _StatefulWidgetPageState extends State<StatefulWidgetPage> {
  int _mCurrentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [];
    pages.add(_buildFirstPage());
    pages.add(_buildSecondPage());

    var pageController = PageController(
        viewportFraction: 0.8, keepPage: false, initialPage: _mCurrentIndex);

    return Scaffold(
      appBar: AppBar(title: Text("StatefulWidgetPage")),
      floatingActionButton: FloatingActionButton(
          child: Text("浮动"), onPressed: () => print("浮动按钮点击")),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() {
          _mCurrentIndex = index;
          pageController.animateToPage(_mCurrentIndex,
              duration: Duration(milliseconds: 200), curve: Curves.easeInCirc);
        }),
        selectedItemColor: Colors.red,
        currentIndex: _mCurrentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_sharp),
              activeIcon: Icon(
                Icons.account_box_sharp,
                color: Colors.red,
              ),
              label: "首页"),
          BottomNavigationBarItem(
              icon: Icon(Icons.call),
              activeIcon: Icon(
                Icons.call,
                color: Colors.red,
              ),
              label: "通话")
        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) => setState(() {
          _mCurrentIndex = index;
        }),
        children: pages,
      ),
    );
  }

  Widget _buildSecondPage() {
    return RefreshIndicator(
        child: ListView(
          children: [
            Container(
              color: Colors.deepPurple,
              width: 200,
              height: 200,
            ),
            TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  hintText: "请输入内容",
                  hintStyle: TextStyle(fontSize: 15)),
              onTap: () {
                print("点击了什么地方呢？");
              },
            )
          ],
        ),
        onRefresh: () async {
          return Future.delayed(Duration(milliseconds: 200));
        });
  }

  Widget _buildFirstPage() {
    return Container(
      color: Colors.deepOrange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            IMAGE_TWO_URL,
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),
          Image.network(IMAGE_TWO_URL,
              width: 100, height: 100, fit: BoxFit.cover),
          // Image.memory(buf, width: 100, height: 100, fit: BoxFit.cover,)
        ],
      ),
    );
  }
}
