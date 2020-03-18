import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/unit.dart';
import 'package:learn_english/ui/common/dialog.dart';
import 'package:provider/provider.dart';

class UnitList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<List<Unit>>(builder: (context, value, child) {
      if (value == null) return Center(child: CircularProgressIndicator());
      return ListView.builder(
          itemCount: value.length,
          itemBuilder: (context, index) {
            if (index >= value.length) return null;
            Unit currentUnit = value[index];
            return ListTile(
                title: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.pink[200],
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        width: 100.0,
                        height: 80.0,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset('assets/ba6.jpg').image,
                              // image: new NetworkImage(''),
                            ),
                            color: Colors.white),
                      ),
                      SizedBox(width: 15),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Container(
                              child: Text(
                            '${currentUnit.name}',
                            textAlign: TextAlign.start,
                            style: new TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.fade,
                          )),
                        ),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return MyDialog(
                          unitName: currentUnit.name,
                          unitId: currentUnit.unitId,
                          bookId: currentUnit.bookId,
                        );
                      });
                  // Navigator.pushNamed(context, RouteName.learingWord, arguments: [currentUnit.bookId, currentUnit.unitId]);
                });
          });
    });
  }
}
