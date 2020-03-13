// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:learn_english/core/models/unit.dart';
// import 'package:learn_english/core/services/unit_service.dart';
// import 'package:learn_english/widgets/chant.dart';
// import 'package:learn_english/widgets/song.dart';

// class UnitList extends StatefulWidget { 
//   String indexBookId;
//   String bookTitle;
//   UnitList({ Key key, this.indexBookId, this.bookTitle}) : super(key : key);
//   @override
//   UnitListState createState() => UnitListState();
// }

// class UnitListState extends State<UnitList> {
//   UnitService _unitService = new UnitService();
//   List<Unit> units = [];
//   bool loading = false;

//   @override
//   void initState(){
//     super.initState();
//     fetchUnits();
//   }

//   Future<Null> fetchUnits() async{
//     this.setState((){
//       loading = true;
//     });

//     List<Unit> fetchedUnits = await _unitService.getListUnit(widget.indexBookId);
//     this.setState((){
//       units = fetchedUnits;
//       loading = false;
//     });
//   }

// 	@override 
// 	Widget build(BuildContext context) {
// 		return Scaffold(
// 			appBar: AppBar(
// 				title : Text(widget.bookTitle),
// 				leading: IconButton(
// 					icon : Icon(
// 						Icons.arrow_back,
// 						color: Colors.white,
// 					),
// 					onPressed: (){
// 						Navigator.maybePop(context);
// 					}
// 				),
// 				automaticallyImplyLeading: true,
// 			),
// 			body: Stack(
//         children : <Widget>[
//           Container(
//               child: new Image.asset(
//             "assets/bg.jpg",
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             fit: BoxFit.fill,
//           )),
//           Center(
//             child: new ListView.builder(
//               padding: EdgeInsets.all(10.0),
//               itemBuilder: _buildRow
//             ),
// 			    ),
//           loading ? Stack(
//             children: <Widget>[
//               Opacity(
//                 opacity: 0.7,
//                 child: ModalBarrier(dismissible: false, color : Colors.black),
//               ),
//               Center(
//                 child: CircularProgressIndicator(),
//               )
//             ],
//           ) : Stack()
//         ]
//       )
// 		);
// 	}

// 	Widget _buildRow(context, index) {
// 		if (index >= units.length) 
// 			return null;

//     Unit currentUnit = units[index];
// 		return new ListTile(
//       title: Container(
//         height: 100,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.0),
//           color: Colors.pink[200],
//           // color: Color.fromRGBO(255, 255, 255, 1.0),
//         ),
//         child: Row(
//           children: <Widget>[
//             Container(
//               margin: EdgeInsets.only(left: 10.0),
//               width: 100.0,
//               height: 80.0,
//               decoration: new BoxDecoration(
//                   borderRadius: BorderRadius.circular(15.0),
//                   image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: Image.asset('assets/ba6.jpg').image,
//                   ),
//                   // image: new NetworkImage(
//                   //  'https://firebasestorage.googleapis.com/v0/b/learn-english-7c4c5.appspot.com/o/screen_2.jpg?alt=media&token=c478dbc4-78d9-4094-bef9-aeee13f31aad')),
//                   color: Colors.white),
//             ),
//             SizedBox(width: 15),
//             Flexible(
//               child: Padding(
//                 padding: const EdgeInsets.only(right: 10.0),
//                 child: Container(
//                     child: Text(
//                   '${currentUnit.name}',
//                   textAlign: TextAlign.start,
//                   style: new TextStyle(
//                     color: Colors.black54,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   overflow: TextOverflow.fade,
//                 )),
//               ),
//             )
//           ],
//         ),
//       ),
// 			onTap: () {
// 				Navigator.push(context, 
// 					MaterialPageRoute(builder: (context) => Song(
// 						 name: currentUnit.name,
//              song: currentUnit.song,
// 					)));
// 			},
// 		);
// 	}
// }