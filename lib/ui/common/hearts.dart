import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/ui/state/heart_state.dart';
import 'package:provider/provider.dart';

class Heart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HeartState heartState = Provider.of<HeartState>(context);
    return Row(
      children: <Widget>[
        Icon(
          Icons.favorite,
          size: 27,
          color: Colors.white,
        ),
        Text(
          '${heartState.getHeartNum}',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        )
      ],
    );
  }
}
