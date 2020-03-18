// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:learn_english/core/services/book_service.dart';
// import 'package:learn_english/screens/home_page.dart';

// class LoginPage extends StatefulWidget {
//   LoginPage({Key key}) : super(key: key);
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   BookService bookService = new BookService();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.fromLTRB(15, 60, 15, 60),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
            
//             children: <Widget>[
//               Stack(
//                 children: <Widget>[
//                   Container(
              
//                     width: 230,
//                     height: 230,
//                     decoration: BoxDecoration(
//                       // borderRadius: BorderRadius.circular(
//                       //     MediaQuery.of(context).size.width),
//                       shape: BoxShape.circle,
//                       gradient: LinearGradient(
//                         colors: [Colors.pink[50], Colors.pink],
//                         begin: Alignment.bottomLeft,
//                         end: Alignment.bottomRight,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 7,
//                     left: 3,
//                     right: 9,
//                     bottom: 7,
//                     child: CircleAvatar(
//                       backgroundImage: Image.asset('assets/owl.jpg').image,
//                     ),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: <Widget>[
//                   Text(
//                     "Lingo",
//                     style: TextStyle(
//                       fontSize: 45,
//                       color: Colors.pink,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     "Change The Future",
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.pink[400],
//                     ),
//                   ),
//                 ],
//               ),
//               Center(
//                 child: Column(
//                   children: <Widget>[
//                     Container(
//                       width: 230,
//                       decoration: BoxDecoration(
//                           border: Border.all(width: 1.2, color: Colors.pink),
//                           borderRadius: BorderRadius.circular(50)),
//                       child: FlatButton(
//                         onPressed: () {
//                           // bookService.getData();
//                         },
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Icon(
//                               FontAwesomeIcons.facebookF,
//                               color: Colors.blue[900],
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Text(
//                               "Login with Facbook",
//                               style: TextStyle(
//                                 fontSize: 17.5,
//                                 color: Colors.pink[400],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       width: 230,
//                       decoration: BoxDecoration(
//                           border: Border.all(width: 1.2, color: Colors.pink),
//                           borderRadius: BorderRadius.circular(50)),
//                       child: FlatButton(
//                         onPressed: () {},
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Icon(
//                               FontAwesomeIcons.google,
//                               color: Colors.pink,
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Text(
//                               "Login with Google",
//                               style: TextStyle(
//                                 fontSize: 17.5,
//                                 color: Colors.pink[400],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
