import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';

class Body extends StatelessWidget {
  final Widget child;

  const Body({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.teal[300]
                : Colors.purple[200],
            height: 35,
            padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
            child: ResponsiveGridRow(children: [
              ResponsiveGridCol(
                xs: 6,
                child: Container(
                  height: 35,
                  alignment: Alignment.centerLeft,
                  child: Text('LCO: 4763547856',
                      style: TextStyle(fontSize: 16.0, color: Colors.black87)),
                ),
              ),
              ResponsiveGridCol(
                xs: 6,
                child: Container(
                    height: 35,
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.rupeeSign, color: Colors.black87, size: 14.0,),
                        Text('100.00',
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.black87))
                      ],
                    )),
              ),
            ])),
        Container(margin: const EdgeInsets.only(top: 35.0), child: this.child),
      ],
    );
  }
}
