import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.brightness_3),
              title: const Text('Dark theme'),
              onTap: null,
              trailing: Switch(
                value: Theme.of(context).brightness == Brightness.dark,
                onChanged: (bool value)=> {
                  DynamicTheme.of(context).setBrightness(value ? Brightness.dark : Brightness.light)
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
