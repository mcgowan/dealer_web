import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  
  Widget _buildBottomNavItem(IconData icon, String text, Function onTap) {
    return Expanded(
      child: SizedBox(
        height: 46,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onTap,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(icon, size: 20,
                ),
                Text(text, style: TextStyle(fontSize: 10))
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomAppBar build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 46,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildBottomNavItem(Icons.inbox, 'Inbox', () => {
              Navigator.pushNamed(context, '/inbox')
            }),
            _buildBottomNavItem(Icons.insert_chart, 'Dashboard', () => {
              Navigator.pushNamed(context, '/dashboard')
            }),
            _buildBottomNavItem(Icons.supervised_user_circle, 'Customers', () => {
              Navigator.pushNamed(context, '/customer_list')
            }),
            _buildBottomNavItem(Icons.style, 'Tickets', () => {
              Navigator.pushNamed(context, '/tickets')
            }),
            _buildBottomNavItem(Icons.monetization_on, 'Wallet', () => {
              Navigator.pushNamed(context, '/wallet')
            }),
          ],
        ),
      ),
    );
  }
}
