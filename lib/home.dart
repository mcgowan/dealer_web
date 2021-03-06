// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart' show debugDumpRenderTree, debugDumpLayerTree, debugDumpSemanticsTree, DebugSemanticsDumpOrder;
// // import 'package:flutter/scheduler.dart' show timeDilation;
// import 'package:flutter/gestures.dart' show DragStartBehavior;
// import 'package:provider/provider.dart';

// import './services/graphql_client.dart';

// import 'i18n/stock_strings.dart';
// import 'stock_data.dart';
// import 'stock_list.dart';
// import 'stock_symbol_viewer.dart';
// import 'stock_types.dart';

// typedef ModeUpdater = void Function(StockMode mode);

// enum _StockMenuItem { autorefresh, refresh, speedUp, speedDown }
// enum StockHomeTab { market, portfolio }

// // class _NotImplementedDialog extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return AlertDialog(
// //       title: const Text('Not Implemented'),
// //       content: const Text('This feature has not yet been implemented.'),
// //       actions: <Widget>[
// //         FlatButton(
// //           onPressed: debugDumpApp,
// //           child: Row(
// //             children: <Widget>[
// //               const Icon(
// //                 Icons.dvr,
// //                 size: 18.0,
// //               ),
// //               Container(
// //                 width: 8.0,
// //               ),
// //               const Text('DUMP APP TO CONSOLE'),
// //             ],
// //           ),
// //         ),
// //         FlatButton(
// //           onPressed: () {
// //             Navigator.pop(context, false);
// //           },
// //           child: const Text('OH WELL'),
// //         ),
// //       ],
// //     );
// //   }
// // }

// class Home extends StatefulWidget {
//   const Home(this.stocks, this.configuration, this.updater);

//   final StockData stocks;
//   final StockConfiguration configuration;
//   final ValueChanged<StockConfiguration> updater;

//   @override
//   HomeState createState() => HomeState();
// }

// class HomeState extends State<Home> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   final TextEditingController _searchQuery = TextEditingController();
//   bool _isSearching = false;
//   bool _autorefresh = false;
//   String _customerName = "";

//   void _handleSearchBegin() {
//     ModalRoute.of(context).addLocalHistoryEntry(LocalHistoryEntry(
//       onRemove: () {
//         setState(() {
//           _isSearching = false;
//           _searchQuery.clear();
//         });
//       },
//     ));
//     setState(() {
//       _isSearching = true;
//     });
//   }

//   void _handleStockModeChange(StockMode value) {
//     if (widget.updater != null)
//       widget.updater(widget.configuration.copyWith(stockMode: value));
//   }

//   // void _handleStockMenu(BuildContext context, _StockMenuItem value) {
//   //   switch (value) {
//   //     case _StockMenuItem.autorefresh:
//   //       setState(() {
//   //         _autorefresh = !_autorefresh;
//   //       });
//   //       break;
//   //     case _StockMenuItem.refresh:
//   //       showDialog<void>(
//   //         context: context,
//   //         builder: (BuildContext context) => _NotImplementedDialog(),
//   //       );
//   //       break;
//   //     case _StockMenuItem.speedUp:
//   //       timeDilation /= 5.0;
//   //       break;
//   //     case _StockMenuItem.speedDown:
//   //       timeDilation *= 5.0;
//   //       break;
//   //   }
//   // }

//   Widget _buildDrawer(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         dragStartBehavior: DragStartBehavior.down,
//         children: <Widget>[
//           const DrawerHeader(child: Center(child: Text('Dealer Web'))),
//           const ListTile(
//             leading: Icon(Icons.assessment),
//             title: Text('Stock List'),
//             selected: true,
//           ),
//           const ListTile(
//             leading: Icon(Icons.account_balance),
//             title: Text('Account Balance'),
//             enabled: false,
//           ),
//           ListTile(
//             leading: const Icon(Icons.dvr),
//             title: const Text('Dump App to Console'),
//             onTap: () {
//               try {
//                 debugDumpApp();
//                 debugDumpRenderTree();
//                 debugDumpLayerTree();
//                 debugDumpSemanticsTree(DebugSemanticsDumpOrder.traversalOrder);
//               } catch (e, stack) {
//                 debugPrint('Exception while dumping app:\n$e\n$stack');
//               }
//             },
//           ),
//           const Divider(),
//           ListTile(
//             leading: const Icon(Icons.thumb_up),
//             title: const Text('Optimistic'),
//             trailing: Radio<StockMode>(
//               value: StockMode.optimistic,
//               groupValue: widget.configuration.stockMode,
//               onChanged: _handleStockModeChange,
//             ),
//             onTap: () {
//               _handleStockModeChange(StockMode.optimistic);
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.thumb_down),
//             title: const Text('Pessimistic'),
//             trailing: Radio<StockMode>(
//               value: StockMode.pessimistic,
//               groupValue: widget.configuration.stockMode,
//               onChanged: _handleStockModeChange,
//             ),
//             onTap: () {
//               _handleStockModeChange(StockMode.pessimistic);
//             },
//           ),
//           const Divider(),
//           ListTile(
//             leading: const Icon(Icons.settings),
//             title: const Text('Settings'),
//             onTap: _handleShowSettings,
//           ),
//           ListTile(
//             leading: const Icon(Icons.help),
//             title: const Text('About'),
//             onTap: _handleShowAbout,
//           ),
//           ListTile(
//             leading: const Icon(Icons.exit_to_app),
//             title: const Text('Logout'),
//             onTap: _handleLogout,
//           ),
//         ],
//       ),
//     );
//   }

//   void _handleShowSettings() {
//     Navigator.popAndPushNamed(context, '/settings');
//   }

//   void _handleShowAbout() {
//     showAboutDialog(context: context);
//   }

//   void _handleLogout() {
//     Navigator.popAndPushNamed(context, '/');
//   }

//   AppBar buildAppBar() {
//     return AppBar(
//       elevation: 0.0,
//       // title: Text("${StockStrings.of(context).title} $_customerName"),
//       title: Text(_customerName),
//       actions: <Widget>[
//         IconButton(
//           icon: const Icon(Icons.search),
//           onPressed: _handleSearchBegin,
//           tooltip: 'Search',
//         ),
//         // PopupMenuButton<_StockMenuItem>(
//         //   onSelected: (_StockMenuItem value) { _handleStockMenu(context, value); },
//         //   itemBuilder: (BuildContext context) => <PopupMenuItem<_StockMenuItem>>[
//         //     CheckedPopupMenuItem<_StockMenuItem>(
//         //       value: _StockMenuItem.autorefresh,
//         //       checked: _autorefresh,
//         //       child: const Text('Autorefresh'),
//         //     ),
//         //     const PopupMenuItem<_StockMenuItem>(
//         //       value: _StockMenuItem.refresh,
//         //       child: Text('Refresh'),
//         //     ),
//         //     const PopupMenuItem<_StockMenuItem>(
//         //       value: _StockMenuItem.speedUp,
//         //       child: Text('Increase animation speed'),
//         //     ),
//         //     const PopupMenuItem<_StockMenuItem>(
//         //       value: _StockMenuItem.speedDown,
//         //       child: Text('Decrease animation speed'),
//         //     ),
//         //   ],
//         // ),
//       ],
//       bottom: TabBar(
//         tabs: <Widget>[
//           Tab(text: StockStrings.of(context).market),
//           Tab(text: StockStrings.of(context).portfolio),
//         ],
//       ),
//     );
//   }

//   void getCustomerName(BuildContext context) {
//     if (_customerName == "") {
//       String query = """
//         query getCustomer(\$customerId: Int!){
//           serverTime
//           customer(id: \$customerId) {
//             defaultAddress {
//               firstName
//               surname
//             }
//           }
//         }
//       """;

//       final client = Provider.of<GraphQLClient>(context, listen: false);
//       client.executeQuery(query, {"customerId": 25641940})
//       .then((result) {
//         dynamic address = result['data']['customer']['defaultAddress'];
//         setState(() {
//           _customerName = "${address['firstName']} ${address['surname']}";
//         });
//       }) ;
//     }
//   }


//   static Iterable<Stock> _getStockList(StockData stocks, Iterable<String> symbols) {
//     return symbols.map<Stock>((String symbol) => stocks[symbol])
//         .where((Stock stock) => stock != null);
//   }

//   Iterable<Stock> _filterBySearchQuery(Iterable<Stock> stocks) {
//     if (_searchQuery.text.isEmpty)
//       return stocks;
//     final RegExp regexp = RegExp(_searchQuery.text, caseSensitive: false);
//     return stocks.where((Stock stock) => stock.symbol.contains(regexp));
//   }

//   void _buyStock(Stock stock) {
//     setState(() {
//       stock.percentChange = 100.0 * (1.0 / stock.lastSale);
//       stock.lastSale += 1.0;
//     });
//     _scaffoldKey.currentState.showSnackBar(SnackBar(
//       content: Text('Purchased ${stock.symbol} for ${stock.lastSale}'),
//       action: SnackBarAction(
//         label: 'BUY MORE',
//         onPressed: () {
//           _buyStock(stock);
//         },
//       ),
//     ));
//   }

//   Widget _buildStockList(BuildContext context, Iterable<Stock> stocks, StockHomeTab tab) {
//     return StockList(
//       stocks: stocks.toList(),
//       onAction: _buyStock,
//       onOpen: (Stock stock) {
//         Navigator.pushNamed(context, '/stock', arguments: stock.symbol);
//       },
//       onShow: (Stock stock) {
//         _scaffoldKey.currentState.showBottomSheet<void>((BuildContext context) => StockSymbolBottomSheet(stock: stock));
//       },
//     );
//   }

//   Widget _buildStockTab(BuildContext context, StockHomeTab tab, List<String> stockSymbols) {
//     return AnimatedBuilder(
//       key: ValueKey<StockHomeTab>(tab),
//       animation: Listenable.merge(<Listenable>[_searchQuery, widget.stocks]),
//       builder: (BuildContext context, Widget child) {
//         return _buildStockList(context, _filterBySearchQuery(_getStockList(widget.stocks, stockSymbols)).toList(), tab);
//       },
//     );
//   }

//   static const List<String> portfolioSymbols = <String>['AAPL','FIZZ', 'FIVE', 'FLAT', 'ZINC', 'ZNGA'];

//   AppBar buildSearchBar() {
//     return AppBar(
//       leading: BackButton(
//         color: Theme.of(context).accentColor,
//       ),
//       title: TextField(
//         controller: _searchQuery,
//         autofocus: true,
//         decoration: const InputDecoration(
//           hintText: 'Search stocks',
//         ),
//       ),
//       backgroundColor: Theme.of(context).canvasColor,
//     );
//   }

//   // void _handleCreateCompany() {
//   //   showModalBottomSheet<void>(
//   //     context: context,
//   //     builder: (BuildContext context) => _CreateCompanySheet(),
//   //   );
//   // }

//   Widget buildFloatingActionButton() {
//     return FloatingActionButton(
//       tooltip: 'Create company',
//       child: const Icon(Icons.add),
//       backgroundColor: Theme.of(context).accentColor,
//       onPressed: () => {},
//       // onPressed: _handleCreateCompany,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     getCustomerName(context);
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         drawerDragStartBehavior: DragStartBehavior.down,
//         key: _scaffoldKey,
//         appBar: _isSearching ? buildSearchBar() : buildAppBar(),
//         floatingActionButton: buildFloatingActionButton(),
//         drawer: _buildDrawer(context),
//         body: TabBarView(
//           dragStartBehavior: DragStartBehavior.down,
//           children: <Widget>[
//             _buildStockTab(context, StockHomeTab.market, widget.stocks.allSymbols),
//             _buildStockTab(context, StockHomeTab.portfolio, portfolioSymbols),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // class _CreateCompanySheet extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: const <Widget>[
// //         TextField(
// //           autofocus: true,
// //           decoration: InputDecoration(
// //             hintText: 'Company Name',
// //           ),
// //         ),
// //         Text('(This demo is not yet complete.)'),
// //         // For example, we could add a button that actually updates the list
// //         // and then contacts the server, etc.
// //       ],
// //     );
// //   }
// // }
