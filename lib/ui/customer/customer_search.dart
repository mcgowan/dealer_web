import 'package:flutter/material.dart';

class CustomerSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search')),
      body: Container(
          alignment: Alignment(0.0, 0.0),
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Customer Search',
            style: TextStyle(fontSize: 40.0),
          )),
    );
  }
}
