
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyString {

  static const HelpGame ="You must select the numbers 1 to 9 so that the sum of the numbers in each row is equal to the number in front of that row and also the sum of the numbers in each column is equal to the number in front of that column.";


}

class MyRoute {
  static String SPLASH_SCREEN='SPLASH_SCREEN';
  static String GAME_SCREEN='GAME_SCREEN';
  static String MENU_SCREEN='HMENU_SCREEN';
}

class MyColors {

  static const Color primary_dark = Color.fromRGBO(24,0,24,1);
  static const Color primary = Color.fromRGBO(57,8,58,1);
  static const Color primary_gray = Color.fromRGBO(90,24,96,0.6);
  static const Color primary_gray_l = Color.fromRGBO(182,106,182,1);

}

class MyDimension {

  //Image and Icone
  static const double LogoBigWidth = 250 ;
  static const double LogoBigHeight = LogoBigWidth ;

  static const double LogoSmallWidth = 60 ;
  static const double LogoSmallHeight = LogoSmallWidth ;

  //Buttons
  static const double ButtonHeight_M = 45 ;
  static const double ButtonRadius_M = 50 ;

}

class MyTextStyle {

  static TextStyle Title =TextStyle(
   color:Colors.white,
   fontSize:45
  );
  static TextStyle Text_Medium =TextStyle(
      color:Colors.white,
      fontSize:30
  );
  static TextStyle Text_Small_primary_gray =TextStyle(
      color:MyColors.primary_gray_l,
      fontSize:26
  );

  static TextStyle Text_Small_white =TextStyle(
      color:Colors.white,
      fontSize:26
  );
  static TextStyle Text_Small_2_primary_gray =TextStyle(
      color:MyColors.primary_gray_l,
      fontSize:16
  );
  static TextStyle Text_Small_2_white =TextStyle(
      color:Colors.white,
      fontSize:18
  );
  static TextStyle Text_Button_Solid_Medium=TextStyle(
      color:MyColors.primary,
      fontSize:30
  );
  static TextStyle Text_Button_Solid_Big=TextStyle(
      color:MyColors.primary,
      fontSize:36
  );
  static TextStyle Text_Button_Solid_Small=TextStyle(
      color:MyColors.primary,
      fontSize:26
  );

  TextStyle Text_Small_custom(color){
     return TextStyle(
        color:color,
        fontSize:26
    );
  }

}
