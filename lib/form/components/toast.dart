import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String text, bool error) {
  Fluttertoast.showToast(
      msg: text,
      timeInSecForIosWeb: 3,
      textColor: Colors.white,
      backgroundColor: error ? Colors.red : Colors.greenAccent);
}
