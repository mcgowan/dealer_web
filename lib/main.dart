// *** concerns for cross-platform ***
// [ ] display of full-screen dialog, route to dialog
// [ ] file access for bulk upload
// [ ] hide footer nav for web

// [x] placeholder for all customer pages
// [x] fab button on customer list, route to customer create
// [x] find customer icons
// [x] convert search to dialog
// [x] convert create customer to dialog
// [x] lco panel
// [ ] build create customer form
// [ ] set app icon
// [x] import font awesome, use rupee symbol for balance
// [ ] update login screen theme

import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart' show
//   debugPaintSizeEnabled,
//   debugPaintBaselinesEnabled,
//   debugPaintLayerBordersEnabled,
//   debugPaintPointersEnabled,
//   debugRepaintRainbowEnabled;
import 'package:provider/provider.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import './services/graphql_client.dart';

// import 'i18n/stock_strings.dart';
// import 'stock_data.dart';
// import 'stock_home.dart';
// import 'stock_settings.dart';
// import 'stock_symbol_viewer.dart';
// import 'stock_types.dart';

import './utils/custom_route.dart';
import './ui/login/login.dart';
import './ui/dealer/inbox.dart';
import './ui/dealer/dashboard.dart';
import './ui/dealer/tickets.dart';
import './ui/dealer/wallet.dart';
import './ui/customer/customer_dashboard.dart';
import './ui/customer/customer_list.dart';

class DealerNet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => ThemeData(
              primarySwatch: Colors.purple,
              brightness: brightness,
            ),
        themedWidgetBuilder: (context, theme) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Dealer Net',
              theme: theme,
              onGenerateRoute: (RouteSettings settings) {
                switch (settings.name) {
                  case '/':
                    return new CustomRoute(
                        builder: (_) => new Login(), settings: settings);
                  case '/inbox':
                    return new CustomRoute(
                        builder: (_) => new Inbox(), settings: settings);
                  case '/dashboard':
                    return new CustomRoute(
                        builder: (_) => new Dashboard(), settings: settings);
                  case '/tickets':
                    return new CustomRoute(
                        builder: (_) => new Tickets(), settings: settings);
                  case '/wallet':
                    return new CustomRoute(
                        builder: (_) => new Wallet(), settings: settings);
                  case '/customer_dashboard':
                    return new CustomRoute(
                        builder: (_) => new CustomerDashboard(),
                        settings: settings);
                  case '/customer_list':
                    return new CustomRoute(
                        builder: (_) => new CustomerList(), settings: settings);
                }
                return null;
              });
        });
  }
}

// void main() {
//   runApp(StocksApp());
// }

void main() {
  // TODO: Figure out what to do with the hardcoded url
  const String url = "http://172.16.77.59/asm/all/graphql/csr/api";
  const String clientName = "dealernet";
  const String dsn = "tnor";
  final graphQLClient = GraphQLClient(url: url, client: clientName, defaultDsn: dsn);

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => graphQLClient),
      ],
      child: DealerNet(),
    ),
  );
}

// void main() {
//   runApp(DealerNet());
// }

