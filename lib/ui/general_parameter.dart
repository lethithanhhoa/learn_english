import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
const Color primaryColor = (kIsWeb)? Colors.teal : Colors.lightGreen;
const Color parentPrimaryColor = (kIsWeb)? Color(0xFF00796B) : Color(0xFF388E3C);
const Color mainWidgetColor = (kIsWeb)? Colors.teal : Color(0xFFA5D6A7); // teal or green[200]
const Color appBarColor = (kIsWeb)? Colors.teal : Color(0xFF81C784); // teal or green[300]
const bool leadingAppBar = (kIsWeb)? true : false;
const double blackOpacity = (kIsWeb)? 1.0: 0.7; //black and black.withOpacity(0.7)
const Color signOutButtonColor = (kIsWeb)? Colors.orange : Color(0xFFFFCC80);
const String coverPhoto = (kIsWeb)? 'assets/cover1.jpg' : 'assets/cover.jpg';
const Color titleRankingColor = (kIsWeb)? Colors.teal : Colors.white;
const double blackOpacityAtRanking = (kIsWeb)? 1.0: 0.6;
const Color highLightTextAtRanking = (kIsWeb)? Colors.teal : Color(0xFF388E3C); // teal or green[700]
const double highLightOpacityAtRanking = (kIsWeb)? 0.3 : 0.2;
const Color backgroundHomPageColor = (kIsWeb)? Colors.white : Color(0xFF81C784);

      
