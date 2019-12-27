import 'package:flutter/material.dart';

class CustomerCreate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Customer')),
      body: Container(
          alignment: Alignment(0.0, 0.0),
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Create Customer',
            style: TextStyle(fontSize: 40.0),
          )),
    );
  }
}
