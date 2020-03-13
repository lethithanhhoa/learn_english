import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/ui/common/bottom_navigation.dart';
import 'package:learn_english/ui/page_models/home/book_list_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BookListProvider(),
      ),
      bottomNavigationBar: NavigationBarInBottom(),
    );
  }  
}