import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/models/book.dart';
import 'package:learn_english/services/book_service.dart';
import 'package:learn_english/widgets/unit_list.dart';
class BookList extends StatefulWidget { 
  BookList({ Key key}) : super(key : key);
  @override
  BookListState createState() => BookListState();
}

class BookListState extends State<BookList> {
  BookService _bookService = new BookService();
  List<Book> books = [];
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

    List<Book> fetchedBooks = await _bookService.getListBook();
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

    Book currentBook = books[index];
		return new ListTile(
			title : Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
						margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
						width: 100.0,
						height: 100.0,
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
              '  ${currentBook.imgName}',
              overflow: TextOverflow.fade,
              maxLines: 1,
              softWrap: false,
            )
          )
        ],
      ),
			onTap: () {
				Navigator.push(context, 
					MaterialPageRoute(builder: (context) => UnitList(
            indexBookId: currentBook.docId,
            bookTitle: currentBook.bookTitle,
					)));
			},
		);
	}
}