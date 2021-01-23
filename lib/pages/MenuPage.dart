
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sumber_puzzle/my_widgets/Buttons.dart';
import 'package:sumber_puzzle/my_widgets/OtherWidgets.dart';
import 'package:sumber_puzzle/pages/GamePage.dart';
import 'package:sumber_puzzle/src/my_variables.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar( // Here we create one to set status bar color
            backgroundColor: MyColors.primary_dark, // Set any color of status bar you want; or it defaults to your theme's primary color
          )
      ),
      body:SafeArea(
        child:Container(
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
          child:W_MenuPage(),
        ),
      ),
    );
  }

  Widget W_MenuPage(){
    return Center(
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Hero(tag: "logo-main_hero",
              child: Image.asset("assets/images/logo.png",width:MyDimension.LogoBigWidth,)),
          Padding(padding:EdgeInsets.fromLTRB(3, 8, 3, 2),
            child:Hero(
              tag:"title_main_hero",
              child:Text("Sumber Puzzle",style:MyTextStyle.Title,),
            ),
          ),
          Padding(padding:EdgeInsets.fromLTRB(3, 8, 3, 30),
            child:Text("Total number puzzle",style:MyTextStyle.Text_Small_primary_gray,),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GamePage()),
                  );
                },
                onDoubleTap: (){

                },
                  child:Buttons_Glass_Graphic("START",MyTextStyle.Text_Medium),
              )
            ],
          )

        ],
      ),
    );
  }

}

