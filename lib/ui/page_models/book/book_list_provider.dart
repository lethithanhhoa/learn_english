import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/book.dart';
import 'package:learn_english/core/services/database_service.dart';
import 'package:learn_english/ui/page_models/book/books_list.dart';
import 'package:provider/provider.dart';

class BookListProvider extends StatelessWidget {
  Database _bookService = new Database();
  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<Book>>.value(
      value: _bookService.getListBook(),
      child: BooksList(),
    );
  }
}

