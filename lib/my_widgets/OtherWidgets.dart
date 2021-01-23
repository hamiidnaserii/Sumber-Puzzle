import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sumber_puzzle/pages/GamePage.dart';
import 'package:sumber_puzzle/src/my_variables.dart';

import 'Buttons.dart';

class OtherWidgets {


  toastShow(String msg,back_color,text_color) {
    Fluttertoast.showToast(
        msg: msg,
        webPosition:"center",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: back_color,
        textColor: text_color,
        fontSize: 16.0
    );
  }



}