import 'package:flutter/material.dart';
// // import 'package:syncfusion_flutter_charts/charts.dart';
// // import 'package:syncfusion_flutter_core/core.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;

import '../common/body.dart';
import '../common/header.dart';
import '../common/footer.dart';
import '../common/menu.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        drawerDragStartBehavior: DragStartBehavior.down,
        appBar: Header().build(context),
        // floatingActionButton: buildFloatingActionButton(),
        drawer: Menu().build(context),
        body: Body(
            child: Container(
          padding: const EdgeInsets.all(8.0),
          child: ResponsiveGridRow(children: [
            ResponsiveGridCol(
              lg: 12,
              child: Container(
                height: 100,
                alignment: Alignment(0, 0),
                color: Colors.purple,
                child: AutoSizeText(
                  'This string will be automatically resized to fit in two lines.',
                  style: TextStyle(fontSize: 30.0),
                  maxLines: 2,
                ),
              ),
            ),
            ResponsiveGridCol(
              xs: 6,
              md: 3,
              child: Container(
                height: 100,
                alignment: Alignment(0, 0),
                color: Colors.green,
                child: AutoSizeText(
                  'This string will be automatically resized to fit in two lines.',
                  style: TextStyle(fontSize: 30.0),
                  maxLines: 2,
                ),
              ),
            ),
            ResponsiveGridCol(
              xs: 6,
              md: 3,
              child: Container(
                height: 100,
                alignment: Alignment(0, 0),
                color: Colors.orange,
                child: AutoSizeText(
                  'This string will be automatically resized to fit in two lines.',
                  style: TextStyle(fontSize: 30.0),
                  maxLines: 2,
                ),
              ),
            ),
            ResponsiveGridCol(
              xs: 6,
              md: 3,
              child: Container(
                height: 100,
                alignment: Alignment(0, 0),
                color: Colors.red,
                child: AutoSizeText(
                  'This string will be automatically resized to fit in two lines.',
                  style: TextStyle(fontSize: 30.0),
                  maxLines: 1,
                ),
              ),
            ),
            ResponsiveGridCol(
              xs: 6,
              md: 3,
              child: Container(
                height: 100,
                alignment: Alignment(0, 0),
                color: Colors.blue,
                child: Text("xs : 6 \r\nmd : 3"),
              ),
            ),
          ]),
        )),
        bottomNavigationBar: Footer().build(context),
      ),
    );
  }
}
