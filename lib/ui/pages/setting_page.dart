import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/ui/state/action_sound_state.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ActionSoundState(),
        )
      ],
      child: SettingState(),
    );
  }
}

class SettingState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ActionSoundState actionSoundState = Provider.of<ActionSoundState>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Setting',
          style: GoogleFonts.handlee(
            textStyle: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
          ),
        ),
        backgroundColor: Colors.green[300],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Action sound',
                  style: TextStyle(fontSize: 20),
                ),
                Transform.scale(
                  scale: 1.3,
                  child: Switch(
                      activeColor: Colors.green,
                      value: actionSoundState.getActionSound,
                      onChanged: (value) {
                        actionSoundState.setActionSound(value);
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
