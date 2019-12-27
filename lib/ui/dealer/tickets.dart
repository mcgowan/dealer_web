import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;

import '../common/body.dart';
import '../common/header.dart';
import '../common/footer.dart';
import '../common/menu.dart';

class Tickets extends StatelessWidget {
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
                alignment: Alignment(0.0, 0.0),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Tickets',
                  style: TextStyle(fontSize: 40.0),
                ))),
        bottomNavigationBar: Footer().build(context),
      ),
    );
  }
}
