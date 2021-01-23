import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sumber_puzzle/my_widgets/Buttons.dart';
import 'package:sumber_puzzle/my_widgets/OtherWidgets.dart';
import 'package:sumber_puzzle/src/my_variables.dart';

class GamePage extends StatefulWidget {
  GamePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  var numberValue = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  var sumValue = [10, 11, 24, 18, 13, 14];
  var sumState = [
    MyColors.primary_gray,
    MyColors.primary_gray,
    MyColors.primary_gray,
    MyColors.primary_gray,
    MyColors.primary_gray,
    MyColors.primary_gray,
  ];
  var numberStateColor = [
    MyColors.primary_gray_l,
    MyColors.primary_gray_l,
    MyColors.primary_gray_l,
    MyColors.primary_gray_l,
    MyColors.primary_gray_l,
    MyColors.primary_gray_l,
    MyColors.primary_gray_l,
    MyColors.primary_gray_l,
    MyColors.primary_gray_l,
  ];
  var listColorNumber = [
    Colors.indigo,
    Colors.deepPurpleAccent,
    Colors.amber,
    Colors.teal,
    Colors.deepOrange,
    Colors.green,
    Colors.purpleAccent,
    Colors.pinkAccent,
    Colors.blue,
    Colors.brown,
  ];
  var ColorNumber = [
    MyColors.primary_gray,
    MyColors.primary_gray,
    MyColors.primary_gray,
    MyColors.primary_gray,
    MyColors.primary_gray,
    MyColors.primary_gray,
    MyColors.primary_gray,
    MyColors.primary_gray,
    MyColors.primary_gray,
  ];

  var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  Timer _timer;

  var h_time = 0;
  var m_time = 0;
  var s_time = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
    GenerateGame();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double w_panel = 350;
    double w_image_help = 250;
    if(width <1000){
      w_panel = (80 * width)/100;
      w_image_help = (50 * width)/100;
    }
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            // Here we create one to set status bar color
            backgroundColor: MyColors
                .primary_dark, // Set any color of status bar you want; or it defaults to your theme's primary color
          )),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            // Box decoration takes a gradient
            gradient: LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.1, 0.9],
              colors: [
                // Colors are easy thanks to Flutter's Colors class.
                MyColors.primary_dark,
                MyColors.primary,
              ],
            ),
          ),
          child: W_GamePage(w_panel,w_image_help),
        ),
      ),
    );
  }

  Widget W_GamePage(w_panel,w_image_help) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
                child: GestureDetector(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(
                  children: [
                    Hero(
                        tag: "logo-main_hero",
                        child: Image.asset(
                          "assets/images/logo.png",
                          width: MyDimension.LogoSmallWidth,
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: "title_main_hero",
                          child: Text(
                            "Sumber Puzzle",
                            style: MyTextStyle.Text_Medium,
                          ),
                        ),
                        Text(
                          "Total number puzzle",
                          style: MyTextStyle.Text_Small_2_primary_gray,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 25, 0),
                child: GestureDetector(
                  onTap: () {
                    _showHelpGame(context,w_image_help);
                  },
                  child: Icon(
                    Icons.info_outline,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Padding(
                //   padding: EdgeInsets.only(bottom: 15),
                //   child: Text(
                //     numbers.toString(),
                //     style: MyTextStyle.Text_Small_2_white,
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text(
                    "Numbers used :",
                    style: MyTextStyle.Text_Small_2_white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "  1  ",
                        style: MyTextStyle()
                            .Text_Small_custom(numberStateColor[0]),
                      ),
                      Text(
                        "  2  ",
                        style: MyTextStyle()
                            .Text_Small_custom(numberStateColor[1]),
                      ),
                      Text(
                        "  3  ",
                        style: MyTextStyle()
                            .Text_Small_custom(numberStateColor[2]),
                      ),
                      Text(
                        "  4  ",
                        style: MyTextStyle()
                            .Text_Small_custom(numberStateColor[3]),
                      ),
                      Text(
                        "  5  ",
                        style: MyTextStyle()
                            .Text_Small_custom(numberStateColor[4]),
                      ),
                      Text(
                        "  6  ",
                        style: MyTextStyle()
                            .Text_Small_custom(numberStateColor[5]),
                      ),
                      Text(
                        "  7  ",
                        style: MyTextStyle()
                            .Text_Small_custom(numberStateColor[6]),
                      ),
                      Text(
                        "  8  ",
                        style: MyTextStyle()
                            .Text_Small_custom(numberStateColor[7]),
                      ),
                      Text(
                        "  9  ",
                        style: MyTextStyle()
                            .Text_Small_custom(numberStateColor[8]),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text(
                    "$h_time : $m_time : $s_time",
                    style: MyTextStyle.Text_Small_white,
                  ),
                ),
                Container(
                  width: w_panel,
                  height: w_panel,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Buttons_Game(ColorNumber[0], numberValue[0], "k1"),
                            Buttons_Game(ColorNumber[1], numberValue[1], "k2"),
                            Buttons_Game(ColorNumber[2], numberValue[2], "k3"),
                            Items_Sum_Numbers(sumState[0], sumValue[0]),
                          ],
                          mainAxisSize: MainAxisSize.max,
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Buttons_Game(ColorNumber[3], numberValue[3], "k4"),
                            Buttons_Game(ColorNumber[4], numberValue[4], "k5"),
                            Buttons_Game(ColorNumber[5], numberValue[5], "k6"),
                            Items_Sum_Numbers(sumState[1], sumValue[1]),
                          ],
                          mainAxisSize: MainAxisSize.max,
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Buttons_Game(ColorNumber[6], numberValue[6], "k7"),
                            Buttons_Game(ColorNumber[7], numberValue[7], "k8"),
                            Buttons_Game(ColorNumber[8], numberValue[8], "k9"),
                            Items_Sum_Numbers(sumState[2], sumValue[2]),
                          ],
                          mainAxisSize: MainAxisSize.max,
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Items_Sum_Numbers(sumState[3], sumValue[3]),
                            Items_Sum_Numbers(sumState[4], sumValue[4]),
                            Items_Sum_Numbers(sumState[5], sumValue[5]),
                            Expanded(
                              flex: 1,
                              child: Center(),
                            )
                          ],
                          mainAxisSize: MainAxisSize.max,
                        ),
                        flex: 1,
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ),
          Padding(padding:EdgeInsets.only(bottom:20,),
            child:GestureDetector(
              onTap: () {
                setdefult();
              },
              child:
              Buttons_Glass_Graphic("New Game", MyTextStyle.Text_Small_white),
            ),
          )
        ],
      ),
    );
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          if (s_time == 59) {
            s_time = -1;
            m_time++;
          }
          if (m_time == 59) {
            m_time = -1;
            h_time++;
          }
          s_time++;
        });
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void showDialogWin(context, time) {
    final double dialogWidth = 400;
    final double dialogHeight = 300;

    Widget _MyDialog = Dialog(
      backgroundColor: MyColors.primary,
      child: Container(
        width: dialogWidth,
        color: MyColors.primary,
        height: dialogHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.auto_awesome,
                    color: Colors.amber,
                    size: 30,
                  ),
                  Text(
                    "YOU WIN",
                    style: MyTextStyle.Title,
                  ),
                  Icon(
                    Icons.auto_awesome,
                    color: Colors.amber,
                    size: 30,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.timer,
                    color: MyColors.primary_gray_l,
                    size: 30,
                  ),
                  Text(
                    "Time : ",
                    style: MyTextStyle.Text_Small_primary_gray,
                  ),
                  Text(
                    time,
                    style: MyTextStyle.Text_Small_white,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setdefult();
                Navigator.of(context, rootNavigator: true).pop();
              },
              child:
                  Buttons_Glass_Graphic("Retry", MyTextStyle.Text_Small_white),
            )
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (context) => _MyDialog);
  }

  Widget Buttons_Game(color, number, key) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          if (number == 9) {
            number = 1;
          } else {
            number++;
          }
          initNumbers(key, number);
          checkAnswer();
          setState(() {});
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(2),
          child: Card(
            color: color,
            child: Center(
              child: Text(
                number.toString(),
                style: MyTextStyle.Title,
                key: Key(key.toString()),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void setdefult() {
    _timer.cancel();
    setState(() {
      numberValue = [0, 0, 0, 0, 0, 0, 0, 0, 0];
      sumValue = [15, 15, 15, 15, 13, 17];
      sumState = [
        MyColors.primary_gray,
        MyColors.primary_gray,
        MyColors.primary_gray,
        MyColors.primary_gray,
        MyColors.primary_gray,
        MyColors.primary_gray,
      ];
      listColorNumber = [
        Colors.indigo,
        Colors.deepPurpleAccent,
        Colors.amber,
        Colors.teal,
        Colors.deepOrange,
        Colors.green,
        Colors.purpleAccent,
        Colors.pinkAccent,
        Colors.blue,
        Colors.brown,
      ];
      ColorNumber = [
        MyColors.primary_gray,
        MyColors.primary_gray,
        MyColors.primary_gray,
        MyColors.primary_gray,
        MyColors.primary_gray,
        MyColors.primary_gray,
        MyColors.primary_gray,
        MyColors.primary_gray,
        MyColors.primary_gray,
      ];
      numberStateColor = [
        MyColors.primary_gray_l,
        MyColors.primary_gray_l,
        MyColors.primary_gray_l,
        MyColors.primary_gray_l,
        MyColors.primary_gray_l,
        MyColors.primary_gray_l,
        MyColors.primary_gray_l,
        MyColors.primary_gray_l,
        MyColors.primary_gray_l,
      ];

      h_time = 0;
      m_time = 0;
      s_time = 0;

      startTimer();
      GenerateGame();
    });
  }

  void initNumbers(key, number) {
    switch (key) {
      case "k1":
        numberValue[0] = number;
        ColorNumber[0] = listColorNumber[number - 1];
        break;
      case "k2":
        numberValue[1] = number;
        ColorNumber[1] = listColorNumber[number - 1];
        break;
      case "k3":
        numberValue[2] = number;
        ColorNumber[2] = listColorNumber[number - 1];
        break;
      case "k4":
        numberValue[3] = number;
        ColorNumber[3] = listColorNumber[number - 1];
        break;
      case "k5":
        numberValue[4] = number;
        ColorNumber[4] = listColorNumber[number - 1];
        break;
      case "k6":
        numberValue[5] = number;
        ColorNumber[5] = listColorNumber[number - 1];
        break;
      case "k7":
        numberValue[6] = number;
        ColorNumber[6] = listColorNumber[number - 1];
        break;
      case "k8":
        numberValue[7] = number;
        ColorNumber[7] = listColorNumber[number - 1];
        break;
      case "k9":
        numberValue[8] = number;
        ColorNumber[8] = listColorNumber[number - 1];
        break;
    }
  }

  void checkAnswer() {
    var sumR1, sumR2, sumR3;
    var sumC1, sumC2, sumC3;

    sumR1 = numberValue[0] + numberValue[1] + numberValue[2];
    sumR2 = numberValue[3] + numberValue[4] + numberValue[5];
    sumR3 = numberValue[6] + numberValue[7] + numberValue[8];

    sumC1 = numberValue[0] + numberValue[3] + numberValue[6];
    sumC2 = numberValue[1] + numberValue[4] + numberValue[7];
    sumC3 = numberValue[2] + numberValue[5] + numberValue[8];

    int i = 0;
    int j = 0;

    if (sumR1 == sumValue[0]) {
      i++;
      sumState[0] = Colors.green;
    } else {
      sumState[0] = MyColors.primary_gray;
    }
    if (sumR2 == sumValue[1]) {
      i++;
      sumState[1] = Colors.green;
    } else {
      sumState[1] = MyColors.primary_gray;
    }
    if (sumR3 == sumValue[2]) {
      i++;
      sumState[2] = Colors.green;
    } else {
      sumState[2] = MyColors.primary_gray;
    }

    if (sumC1 == sumValue[3]) {
      i++;
      sumState[3] = Colors.green;
    } else {
      sumState[3] = MyColors.primary_gray;
    }
    if (sumC2 == sumValue[4]) {
      i++;
      sumState[4] = Colors.green;
    } else {
      sumState[4] = MyColors.primary_gray;
    }
    if (sumC3 == sumValue[5]) {
      i++;
      sumState[5] = Colors.green;
    } else {
      sumState[5] = MyColors.primary_gray;
    }

    for (int i = 1; i < 10; i++) {
      int state = _checkRepeat(i);
      switch (state) {
        case 0:
          numberStateColor[i - 1] = MyColors.primary_gray_l;
          break;
        case 1:
          j++;
          numberStateColor[i - 1] = Colors.green;
          break;
        case -1:
          numberStateColor[i - 1] = Colors.red;
          break;
      }
    }

    if (i == 6 && j == 9) {
      _timer.cancel();
      showDialogWin(context, "$h_time : $m_time : $s_time");
    } else if (i == 6) {
      OtherWidgets().toastShow(
          "The puzzle is solved but there are duplicate numbers",
          Colors.red,
          Colors.white);
    }
  }

  List shuffle(List items) {
    var random = new Random();

    // Go through all elements.
    for (var i = items.length - 1; i > 0; i--) {
      // Pick a pseudorandom number according to the list length
      var n = random.nextInt(i + 1);

      var temp = items[i];
      items[i] = items[n];
      items[n] = temp;
    }

    return items;
  }

  void GenerateGame() {
    var sumR1, sumR2, sumR3;
    var sumC1, sumC2, sumC3;

    numbers = shuffle(numbers);

    sumR1 = numbers[0] + numbers[1] + numbers[2];
    sumR2 = numbers[3] + numbers[4] + numbers[5];
    sumR3 = numbers[6] + numbers[7] + numbers[8];

    sumC1 = numbers[0] + numbers[3] + numbers[6];
    sumC2 = numbers[1] + numbers[4] + numbers[7];
    sumC3 = numbers[2] + numbers[5] + numbers[8];

    sumValue[0] = sumR1;
    sumValue[1] = sumR2;
    sumValue[2] = sumR3;
    sumValue[3] = sumC1;
    sumValue[4] = sumC2;
    sumValue[5] = sumC3;
  }

  int _checkRepeat(num) {
    var check = 0;
    for (int i in numberValue) {
      if (num == i) {
        check++;
      }
    }
    if (check == 0) {
      return 0;
    } else if (check == 1) {
      return 1;
    } else {
      return -1;
    }
  }

  void _showHelpGame(context,w_image_help) {
    final double dialogWidth = 400;
    final double dialogHeight = 500;

    Widget _MyDialog = Dialog(
      backgroundColor: MyColors.primary,
      child:SafeArea(
        child:Wrap(
          // width: dialogWidth,
          // color: MyColors.primary,
          // height: double.infinity,
          children:[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.auto_awesome,
                        color: Colors.deepPurpleAccent,
                        size: 30,
                      ),
                      Text(
                        "How to play?",
                        style: MyTextStyle.Title,
                      ),
                      Icon(
                        Icons.auto_awesome,
                        color: Colors.deepPurpleAccent,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(13),
                      child: Text(
                        MyString.HelpGame,
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 2,
                          fontFamily: '',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Note: You should not use duplicate numbers",
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 2,
                        fontFamily: '',
                        color: Colors.red,
                      )),
                ),
                Image.asset(
                  "assets/images/help.png",
                  width: w_image_help,
                  height: w_image_help,
                ),
              ],
            )
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (context) => _MyDialog);
  }
}
