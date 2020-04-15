import 'package:flutter/material.dart';
import 'package:learn_english/ui/common/close_icon.dart';
import 'package:learn_english/ui/common/hearts.dart';
import 'package:learn_english/ui/common/slider.dart';

Widget appBar = AppBar(
  automaticallyImplyLeading: false,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      CloseIcon(),
      MySlider(),
      Heart(),
    ],
  ),
);
