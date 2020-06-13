import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/core/services/user_service.dart';
import 'package:learn_english/ui/provider/account_user.dart';
import 'package:learn_english/ui/provider/taptap_level_state.dart';
import 'package:provider/provider.dart';

import 'end_game_page.dart';

class TapTapDetailPage extends StatelessWidget {
  List<Vocabulary> vocabList;
  TapTapDetailPage({this.vocabList});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LevelState(vocabList: vocabList),
        ),
        ChangeNotifierProvider(
          create: (context) => AccountUser(),
        )
      ],
      child: TapTapDetail(),
    );
  }
}

class TapTapDetail extends StatefulWidget {
  TapTapDetailState createState() => TapTapDetailState();
}

class TapTapDetailState extends State<TapTapDetail>
    with TickerProviderStateMixin {
  AnimationController animationController;
  UserService userService = UserService();

  String get timerString {
    Duration duration =
        animationController.duration * animationController.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 90));
    startTime();
  }

  void startTime() {
    if (!animationController.isAnimating) {
      animationController.reverse(
          from: animationController.value == 0.0
              ? 1.0
              : animationController.value);
    }
  }

  void stopTime() {
    if (animationController.isAnimating) {
      animationController.stop();
    }
  }

  Future<bool> onWillPop() {
    Fluttertoast.showToast(msg: "Tap 'Close' button to quit");
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    LevelState levelState = Provider.of<LevelState>(context);
    AccountUser accountUser = Provider.of<AccountUser>(context);
    if (levelState.getIsFalse && accountUser.exp < 50)
      levelState.setFinishIsTrue();

    if (levelState.getIsFinish || animationController.value == 0.00)
      return EndGamePage();

    if (levelState.getIsFalse)
      stopTime();
    else
      startTime();

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.green[100],
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.asset('assets/cover.jpg').image,
                fit: BoxFit.cover),
          ),
          child: SafeArea(
            child: Stack(children: [
              LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: constraints.copyWith(
                      minHeight: constraints.maxHeight,
                      maxHeight: double.infinity,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            // SizedBox(height: 100),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Container(
                                height: 140,
                                width: MediaQuery.of(context).size.width,
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Align(
                                      alignment: FractionalOffset.center,
                                      child: AspectRatio(
                                        aspectRatio: 1.0,
                                        child: Stack(
                                          children: <Widget>[
                                            Positioned.fill(
                                              child: AnimatedBuilder(
                                                animation: animationController,
                                                builder: (BuildContext context,
                                                    Widget child) {
                                                  return CustomPaint(
                                                    painter: TimerPainter(
                                                      animation:
                                                          animationController,
                                                      backgroundColor:
                                                          Colors.indigo[50],
                                                      // color: Theme.of(context).accentColor),
                                                      color: Colors.blue[300],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  FractionalOffset.center,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  AnimatedBuilder(
                                                      animation:
                                                          animationController,
                                                      builder:
                                                          (_, Widget child) {
                                                        return Text(
                                                          timerString,
                                                          style: TextStyle(
                                                            color: Colors
                                                                .blue[400],
                                                            fontSize: 35,
                                                          ),
                                                        );
                                                      })
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'Level: ${levelState.getCurrentLevel}',
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[300],
                                    fontFamily: 'Arial'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Container(
                                  width:
                                      (MediaQuery.of(context).size.width > 400)
                                          ? 320
                                          : MediaQuery.of(context).size.width,
                                  height: (MediaQuery.of(context).size.width >
                                          400)
                                      ? 320
                                      : MediaQuery.of(context).size.width - 20,
                                  child: levelState.getCurWidget),
                            ),
                            SizedBox(height: 20)
                          ]),
                    ),
                  ),
                );
              }),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            int count = 0;
                            Navigator.popUntil(context, (route) {
                              return count++ == 2;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.indigo[50].withOpacity(0.8),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                child: Text(
                                  'Quit',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    (levelState.getIsFalse && accountUser.exp >= 50)
                        ? Expanded(
                            child: Center(
                              child: AlertDialog(
                                content: Container(
                                  height: 200,
                                  alignment: Alignment.center,
                                  child: Column(children: <Widget>[
                                    Expanded(
                                      child: Center(
                                          child:
                                              Image.asset('assets/oh_no.jpg')),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          style: GoogleFonts.handlee(
                                              textStyle: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 18)),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Do you want to trade '),
                                            TextSpan(
                                              text: '${50} ',
                                              style: TextStyle(
                                                  color: Colors.orange[300],
                                                  fontSize: 25),
                                            ),
                                            TextSpan(
                                              text: 'EXP ',
                                              style: TextStyle(
                                                  color: Colors.green[300],
                                                  fontSize: 25),
                                            ),
                                            TextSpan(text: 'to continue?'),
                                          ]),
                                    ),
                                  ]),
                                ),
                                actions: [
                                  FlatButton(
                                    onPressed: () {
                                      userService.updateExp(
                                          accountUser.user.userId,
                                          accountUser.exp - 50);
                                      accountUser.decrementExp(50);
                                      levelState.backToPreState();
                                    },
                                    child: Text(
                                      'Yes',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  FlatButton(
                                    onPressed: () {
                                      levelState.setFinishIsTrue();
                                    },
                                    child: Text(
                                      'No',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class TimerPainter extends CustomPainter {
  final Animation<double> animation;
  final Color backgroundColor;
  final Color color;

  TimerPainter({this.animation, this.backgroundColor, this.color})
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * pi;
    canvas.drawArc(Offset.zero & size, pi * 1.5, -progress, false, paint);
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
