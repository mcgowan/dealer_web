import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import '../customer/customer_create.dart';
import '../settings/settings.dart';

class Menu extends StatelessWidget {
  Widget _buildMenuItem(Icon icon, String text, Function onTap, bool enabled) {
    return ListTile(
      leading: icon,
      title: Text(text),
      onTap: onTap,
      enabled: enabled,
    );
  }

  Drawer build(BuildContext context) {
    return Drawer(
        child: ListView(
      dragStartBehavior: DragStartBehavior.down,
      children: <Widget>[
        _buildMenuItem(Icon(Icons.inbox), 'Inbox', () => {
          Navigator.pushNamed(context, '/inbox')
        }, true),
        _buildMenuItem(Icon(Icons.insert_chart), 'Dashboard', () => {
          Navigator.pushNamed(context, '/dashboard')
        }, true),
        _buildMenuItem(Icon(Icons.style), 'Tickets', () => {
          Navigator.pushNamed(context, '/tickets')
        }, true),
        _buildMenuItem(Icon(Icons.monetization_on), 'Wallet', () => {
          Navigator.pushNamed(context, '/wallet')
        }, true),
        Divider(color: Theme.of(context).dividerColor, thickness: 1.0),
        _buildMenuItem(Icon(Icons.person_add), 'Create Customer', () => {
          Navigator.of(context).push(new MaterialPageRoute<Null>(
            builder: (BuildContext context) {
              return new CustomerCreate();
            },
            fullscreenDialog: true)
          )
        }, true),
        _buildMenuItem(Icon(Icons.person), 'Customer Dashboard', () => {
          Navigator.pushNamed(context, '/customer_dashboard')
        }, true),
        _buildMenuItem(Icon(Icons.people), 'Customer List', () => {
          Navigator.pushNamed(context, '/customer_list')
        }, true),
        Divider(color: Theme.of(context).dividerColor, thickness: 1.0),
        _buildMenuItem(Icon(Icons.settings), 'Settings', () => {
          Navigator.of(context).push(new MaterialPageRoute<Null>(
            builder: (BuildContext context) {
              return new Settings();
            },
            fullscreenDialog: true)
          )
        }, true),
        Divider(color: Theme.of(context).dividerColor, thickness: 1.0),
        _buildMenuItem(Icon(Icons.exit_to_app), 'Logout', () => {
          Navigator.pushNamed(context, '/')
        }, true),
      ],
    ));
  }
}
