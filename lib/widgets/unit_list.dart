import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/models/unit.dart';
import 'package:learn_english/services/unit_service.dart';
class UnitList extends StatefulWidget { 
  UnitList({ Key key}) : super(key : key);
  @override
  UnitListState createState() => UnitListState();
}

class UnitListState extends State<UnitList> {
  UnitService _bookService = new UnitService();
  List<Unit> books = [];
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

    List<Unit> fetchedBooks = await _bookService.getListUnit();
    this.setState((){
      books = fetchedBooks;
      loading = false;
    });
  }

	@override 
	Widget build(BuildContext context) {
		return Scaffold(
			bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
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
      ]),
      appBar: AppBar(
        title: Text("Home"),
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
		if (index >= books.length) 
			return null;

    Unit currentBook = books[index];
		return new ListTile(
			title : Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
						margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
						width: 40.0,
						height: 40.0,
						decoration: new BoxDecoration(
							shape: BoxShape.circle,
							image: DecorationImage(
								fit: BoxFit.fill,
								image: new NetworkImage(currentBook.name)
							),
							color: Colors.blue
						),
					),
          Expanded(
            child: Text(
              '  ${currentBook.unitId}',
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