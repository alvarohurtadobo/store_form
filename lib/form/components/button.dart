import 'package:flutter/material.dart';
import 'package:vento_form_flutter/responsive.dart';

Widget customButton(String text, VoidCallback action,
    {bool highlight = false, Color hColor = Colors.greenAccent}) {
  bool enabled = true;
  return Container(
      margin: EdgeInsets.symmetric(horizontal: Responsive.padding),
      width: Responsive.buttonWidth,
      height: Responsive.buttonHeight,
      decoration: BoxDecoration(
          color: const Color(0xfff0f0f0),
          borderRadius: BorderRadius.circular(Responsive.buttonHeight / 2),
          border: highlight ? Border.all(color: hColor, width: 4) : null),
      child: TextButton(
          onPressed: action,
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: enabled ? Colors.black : Colors.grey),
          )));
}
