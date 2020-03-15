import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/unit.dart';
import 'package:learn_english/core/services/database_service.dart';
import 'package:learn_english/ui/page_models/unit/unit_list.dart';
import 'package:provider/provider.dart';

class UnitsListProvider extends StatelessWidget {
  Database _unitService = new Database();
  String bookId;
  UnitsListProvider({this.bookId});
  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<Unit>>.value(
      value: _unitService.getListUnit(bookId),
      child: UnitList(),
    );
  }
}

