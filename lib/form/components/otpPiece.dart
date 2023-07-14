import 'package:flutter/material.dart';
import 'package:vento_form_flutter/responsive.dart';

Widget otpPiece(){
  return Container(
    height: Responsive.bigButtonSize,
    width: Responsive.bigButtonSize*0.8,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(Responsive.bigButtonSize/5)),
      border: Border.all(color: Colors.black)
    ),
    child: TextField(
      expands: true,
      maxLength: 1,
    ),
  );
}