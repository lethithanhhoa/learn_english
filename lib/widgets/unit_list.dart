import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/models/unit.dart';
import 'package:learn_english/services/unit_service.dart';
class UnitList extends StatefulWidget { 
  String indexBookId;
  String bookTitle;
  UnitList({ Key key, this.indexBookId, this.bookTitle}) : super(key : key);
  @override
  UnitListState createState() => UnitListState();
}

class UnitListState extends State<UnitList> {
  UnitService _unitService = new UnitService();
  List<Unit> units = [];
  bool loading = false;

  @override
  void initState(){
    super.initState();
    fetchBooks();
  }

  Future<Null> fetchBooks() async{
    this.setState((){
      loading = true;
    });

    List<Unit> fetchedBooks = await _unitService.getListUnit(widget.indexBookId);
    this.setState((){
      units = fetchedBooks;
      loading = false;
    });
  }

	@override 
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title : Text(widget.bookTitle),
				leading: IconButton(
					icon : Icon(
						Icons.arrow_back,
						color: Colors.white,
					),
					onPressed: (){
						Navigator.maybePop(context);
					}
				),
				automaticallyImplyLeading: true,
			),
			body: Stack(
        children : <Widget>[
          Container(
              child: new Image.asset(
            "assets/bg.jpg",
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          )),
          Center(
            child: new ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemBuilder: _buildRow
            ),
			    ),
          loading ? Stack(
            children: <Widget>[
              Opacity(
                opacity: 0.7,
                child: ModalBarrier(dismissible: false, color : Colors.black),
              ),
              Center(
                child: CircularProgressIndicator(),
              )
            ],
          ) : Stack()
        ]
      )
		);
	}

	Widget _buildRow(context, index) {
		if (index >= units.length) 
			return null;

    Unit currentUnit = units[index];
		return new ListTile(
			title : Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
						margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
						width: 60.0,
						height: 60.0,
						decoration: new BoxDecoration(
							shape: BoxShape.circle,
							image: DecorationImage(
								fit: BoxFit.fill,
								image: new NetworkImage('https://firebasestorage.googleapis.com/v0/b/learn-english-7c4c5.appspot.com/o/screen_2.jpg?alt=media&token=c478dbc4-78d9-4094-bef9-aeee13f31aad')
							),
							color: Colors.blue
						),
					),
          Expanded(
            child: Text(
              '  ${currentUnit.unitId}',
              overflow: TextOverflow.fade,
              maxLines: 1,
              softWrap: false,
            )
          )
        ],
      ),
			// onTap: () {
			// 	Navigator.push(context, 
			// 		MaterialPageRoute(builder: (context) => UnitList(
			// 			bookId : currentBook.bookId,
			// 			bookTitle : currentBook.name 
			// 		)));
			// },
		);
	}
}