// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:learn_english/ui/page_models/home/book_list_provider.dart';

// class HomePage extends StatefulWidget {
//   HomePage({Key key}) : super(key: key);
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: _bottomNavigationBar(context),
//       body: BooksListProvider(),
//     );
//   }

//   Widget _bottomNavigationBar(BuildContext context) {
//     return BottomNavigationBar(items: <BottomNavigationBarItem>[
//       BottomNavigationBarItem(
//         icon: Icon(Icons.home),
//         title: Text("Home"),
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(Icons.autorenew),
//         title: Text("Rankking"),
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(Icons.account_circle),
//         title: Text("Account"),
//       ),
//     ]);
//   }
// }
