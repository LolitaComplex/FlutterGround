import 'package:FlutterPlayground/inherited/refresh/part/refresh_part_widget_page.dart';
import 'package:flutter/material.dart';

import 'part_refresh_wrapper.dart';

class RefreshPart2WidgetC extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    PartRefreshWrapperState? state = PartRefreshWrapper.of(context, isRebuild: false);

    print("RefreshPart2: WidgetC refresh");
    return MaterialButton(onPressed: state?.incrementCount,
      child: Icon(Icons.add),
    );
  }
}

