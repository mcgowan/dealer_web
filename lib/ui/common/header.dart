import 'package:flutter/material.dart';
import '../customer/customer_search.dart';

class Header extends StatelessWidget {
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(elevation: 0.0, title: Text('Dealer Net'), actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: () => {
          Navigator.of(context).push(new MaterialPageRoute<Null>(
            builder: (BuildContext context) {
              return new CustomerSearch();
            },
            fullscreenDialog: true)
          )
        },
        tooltip: 'Search',
      )
    ]);
  }
}