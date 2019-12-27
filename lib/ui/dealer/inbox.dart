import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
// import 'package:responsive_grid/responsive_grid.dart';
import '../common/header.dart';
import '../common/body.dart';
import '../common/footer.dart';
import '../common/menu.dart';

class Inbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        drawerDragStartBehavior: DragStartBehavior.down,
        appBar: Header().build(context),
        drawer: Menu().build(context),
        body: Body(
            child: ListView(
                // dragStartBehavior: DragStartBehavior.down,
                children: <Widget>[
              ListTile(
                title: Text('List Item'),
              ),
              ListTile(
                title: Text('List Item'),
              ),
              ListTile(
                title: Text('List Item'),
              ),
              ListTile(
                title: Text('List Item'),
              ),
              ListTile(
                title: Text('List Item'),
              ),
              ListTile(
                title: Text('List Item'),
              ),
              ListTile(
                title: Text('List Item'),
              ),
              ListTile(
                title: Text('List Item'),
              ),
              ListTile(
                title: Text('List Item'),
              ),
              ListTile(
                title: Text('List Item'),
              ),
              ListTile(
                title: Text('List Item'),
              ),
              ListTile(
                title: Text('List Item'),
              ),
              ListTile(
                title: Text('List Item'),
              ),
              ListTile(
                title: Text('List Item'),
              ),
              ListTile(
                title: Text('List Item'),
              ),
              ListTile(
                title: Text('List Item'),
              ),
              ListTile(
                title: Text('List Item'),
              ),
              ListTile(
                title: Text('List Item'),
              ),
              ListTile(
                title: Text('List Item'),
              ),
              ListTile(
                title: Text('List Item'),
              ),
              ListTile(
                title: Text('List Item'),
              )
            ])),
        bottomNavigationBar: Footer().build(context),
      ),
    );
  }
}
// class Inbox extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Scaffold(
//         drawerDragStartBehavior: DragStartBehavior.down,
//         appBar: Header().build(context),
//         drawer: Menu().build(context),
//         body: Stack(
//           children: <Widget>[
//             Container(
//                 color: Theme.of(context).brightness == Brightness.dark
//                     ? Colors.teal[300]
//                     : Colors.purple[200],
//                 height: 35,
//                 padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
//                 child: ResponsiveGridRow(children: [
//                   ResponsiveGridCol(
//                     xs: 6,
//                     child: Container(
//                       height: 35,
//                       alignment: Alignment.centerLeft,
//                       child: Text('LCO: 4763547856',
//                           style: TextStyle(fontSize: 16.0, color: Colors.black87)),
//                     ),
//                   ),
//                   ResponsiveGridCol(
//                     xs: 6,
//                     child: Container(
//                       height: 35,
//                       alignment: Alignment.centerRight,
//                       child: Text('100.00',
//                           style: TextStyle(fontSize: 16.0, color: Colors.black87)),
//                     ),
//                   ),
//                 ])),
//             Container(
//                 margin: const EdgeInsets.only(top: 35.0),
//                 child: ListView(
//                     // dragStartBehavior: DragStartBehavior.down,
//                     children: <Widget>[
//                       ListTile(
//                         title: Text('List Item'),
//                       ),
//                       ListTile(
//                         title: Text('List Item'),
//                       ),
//                       ListTile(
//                         title: Text('List Item'),
//                       ),
//                       ListTile(
//                         title: Text('List Item'),
//                       ),
//                       ListTile(
//                         title: Text('List Item'),
//                       ),
//                       ListTile(
//                         title: Text('List Item'),
//                       ),
//                       ListTile(
//                         title: Text('List Item'),
//                       ),
//                       ListTile(
//                         title: Text('List Item'),
//                       ),
//                       ListTile(
//                         title: Text('List Item'),
//                       ),
//                       ListTile(
//                         title: Text('List Item'),
//                       ),
//                       ListTile(
//                         title: Text('List Item'),
//                       ),
//                       ListTile(
//                         title: Text('List Item'),
//                       ),
//                       ListTile(
//                         title: Text('List Item'),
//                       ),
//                       ListTile(
//                         title: Text('List Item'),
//                       ),
//                       ListTile(
//                         title: Text('List Item'),
//                       ),
//                       ListTile(
//                         title: Text('List Item'),
//                       ),
//                       ListTile(
//                         title: Text('List Item'),
//                       ),
//                       ListTile(
//                         title: Text('List Item'),
//                       ),
//                       ListTile(
//                         title: Text('List Item'),
//                       ),
//                       ListTile(
//                         title: Text('List Item'),
//                       ),
//                       ListTile(
//                         title: Text('List Item'),
//                       ),
//                     ])),
//           ],
//         ),
//         bottomNavigationBar: Footer().build(context),
//       ),
//     );
//   }
// }
