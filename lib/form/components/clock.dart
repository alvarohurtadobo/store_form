import 'package:flutter/material.dart';

Widget clock(int seconds){
  int minutes = seconds~/60;
  seconds = seconds - minutes*60;
  return Row(children: [
    Icon(Icons.timer, color: Colors.grey,),
  Text("${minutes.toString().padLeft(2,'0')}:${seconds.toString().padLeft(2,'0')}")
  ],);
}