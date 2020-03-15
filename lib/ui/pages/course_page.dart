import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learn_english/ui/page_models/unit/unit_list_provider.dart';
class Course extends StatefulWidget{
  String bookId;
  String bookTitle;
  Course({ Key key, this.bookId, this.bookTitle}) : super(key : key);
  @override  
  CourseState createState() => CourseState();
  
}

class CourseState extends State<Course>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.bookTitle),),
      body: UnitsListProvider(bookId: widget.bookId,),
    );
  }
  
}