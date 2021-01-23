
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sumber_puzzle/pages/GamePage.dart';
import 'package:sumber_puzzle/src/my_variables.dart';


Widget Buttons_Rounded_Solid_White(text,text_style) {

  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(MyDimension.ButtonRadius_M),
    ),
    color:Colors.white,
    child:Padding(
      padding:EdgeInsets.symmetric(vertical:5,horizontal:20),
      child:Text(text,style:text_style,),
    ),


  );

}

Widget Buttons_Glass_Graphic(text,text_style) {

  return Column(
    mainAxisSize:MainAxisSize.min,

    children: [
      Stack(
        alignment: Alignment.center,
        children:[
          Image.asset("assets/images/button_glass.png",height:60,),
          Container(
            height:60,
            child:Row(
              mainAxisAlignment:MainAxisAlignment.center,
              crossAxisAlignment:CrossAxisAlignment.center,
              children: [
                Text(text,style:text_style,)
              ],
            ),
          ),
        ],
      )
    ],
  );

}


Widget Items_Sum_Numbers(color,number){

  return Expanded(
    flex:1,
    child:Container(
      padding:EdgeInsets.all(4),
      width:double.infinity,
      height:double.infinity,
      child:Container(
          width:double.infinity,
          height:double.infinity,
          decoration: BoxDecoration(
              borderRadius: new BorderRadius.all(const Radius.circular(6)),
              border: Border.all(color: color,width:3)

          ),
          child:Center(
            child: Text(number.toString(),style:MyTextStyle.Title,),
          )
      ),
    ),
  );

}