import 'package:FlutterPlayground/inherited/refresh/part/refresh_part_widget_page.dart';
import 'package:flutter/material.dart';

class RefreshPartWidgetC extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var state = RefreshPartWidgetPage.of(context, rebuild: false);

    print("RefreshPart: WidgetC refresh");
    return MaterialButton(onPressed: state?.incrementCount,
      child: Icon(Icons.add),
    );
  }
}

