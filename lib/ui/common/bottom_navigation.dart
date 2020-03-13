import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationBarInBottom extends StatelessWidget {
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text("Home"),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.autorenew),
        title: Text("Rankking"),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        title: Text("Account"),
      ),
    ]);
  }
}
