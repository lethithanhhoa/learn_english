import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_english/models/book.dart';
import 'package:learn_english/services/book_service.dart';
import 'package:learn_english/widgets/unit_list.dart';
import 'package:learn_english/services/image_service.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

class BookList extends StatefulWidget {
  BookList({Key key}) : super(key: key);
  @override
  BookListState createState() => BookListState();
}

class BookListState extends State<BookList> {
  BookService _bookService = new BookService();
  List<Book> books = [];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  Future<Null> fetchBooks() async {
    this.setState(() {
      loading = true;
    });

    List<Book> fetchedBooks = await _bookService.getListBook();
    this.setState(() {
      books = fetchedBooks;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:
            BottomNavigationBar(items: <BottomNavigationBarItem>[
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
        // appBar: AppBar(
        //   title: Text("Home"),
        //   // backgroundColor: Colors.white,
        //   actions: <Widget>[
        //     Icon(
        //       FontAwesomeIcons.award,
        //       color: Colors.white,
        //     ),
        //   ],
        // ),
        body: Stack(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 2 / 5,
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.red),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(60.0)),
                ),
                child: Stack(children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(60.0)),
                      image: DecorationImage(
                          image: Image.asset("assets/ba21.jpg").image,
                          fit: BoxFit.cover),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: Container(
                          child: Text(
                            'Recent Course',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            // image: DecorationImage(
                            //   image: Image.asset("assets/ba17.jpg").image,
                            //   fit: BoxFit.cover
                            // ),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Container(
                  child: Text(
                    'Courses',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: new ListView.builder(
                  // scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(10.0),
                  itemBuilder: _buildRow,
                ),
              ),
            ],
          ),
          loading
              ? Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.7,
                      child:
                          ModalBarrier(dismissible: false, color: Colors.black),
                    ),
                    Center(
                      child: CircularProgressIndicator(),
                    )
                  ],
                )
              : Stack()
        ]));
  }

  Widget _buildRow(context, index) {
    if (index >= books.length) return null;
    Book currentBook = books[index];
    // String url = '';
    // ImageService _imageService = new ImageService(url, currentBook.imgName);
    // print("........................ ${currentBook.imgName}");
    // print(_imageService.url);
    return new ListTile(
      title: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          // color: Color.fromRGBO(255, 255, 255, 1.0),
          color: Colors.purple[300],
          // gradient: LinearGradient(
          //   // colors: [Colors.pink[50], Colors.pink[100], Colors.pink[50]],
          //   // colors: [Colors.lime[100], Colors.lime, Colors.lime[100]],
          //   // colors: [Colors.lime, Colors.yellow, Colors.yellow[100]],
          //   // colors: [Colors.purple[800], Colors.purple[800]],
          //   begin: Alignment.bottomLeft,
          //   end: Alignment.bottomRight,
          // ),
        ),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10.0),
              width: 100.0,
              height: 80.0,
              decoration: new BoxDecoration(
                  // border: Border.all(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(
                          'https://firebasestorage.googleapis.com/v0/b/learn-english-7c4c5.appspot.com/o/screen_2.jpg?alt=media&token=c478dbc4-78d9-4094-bef9-aeee13f31aad')),
                  color: Colors.blue),
            ),
            SizedBox(width: 15),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Container(
                    child: Text(
                  '${currentBook.bookTitle}',
                  textAlign: TextAlign.start,
                  style: new TextStyle(
                    // color: Colors.black54,
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  // overflow: TextOverflow.fade,
                )),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UnitList(
                      indexBookId: currentBook.docId,
                      bookTitle: currentBook.bookTitle,
                    )));
      },
    );
  }
}
