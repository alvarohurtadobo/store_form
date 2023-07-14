import 'package:flutter/material.dart';
import 'package:vento_form_flutter/responsive.dart';

Widget customDropDown(
    List<dynamic> myList, int? myValue, Function(int?) updateValue,
    {bool isExpanded = false,
    bool enabled = true,
    bool error = false,
    double width = 200}) {
  List<int> myValues = myList.map<int>((e) => e.id).toList();
  print("Dropdown initial $myValue in $myValues");
  return Container(
    alignment: Alignment.center,
    width: width,
    height: Responsive.buttonHeight,
    padding: EdgeInsets.symmetric(horizontal: Responsive.padding * 2),
    decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), //color of shadow
            spreadRadius: 5, //spread radius
            blurRadius: 7, // blur radius
            offset: const Offset(0, 2),
            //first paramerter of offset is left-right
            //second parameter is top to down
          ),
          //you can set more BoxShadow() here
        ],
        borderRadius:
            BorderRadius.all(Radius.circular(Responsive.buttonHeight / 2))),
    child: DropdownButton<int>(
        alignment: Alignment.bottomLeft,
        isExpanded: true,
        value: myValue,
        underline: const SizedBox.shrink(),
        // iconEnabledColor: const Color(0xffbc171d),
        items: myList
            .map((e) => DropdownMenuItem<int>(
                  alignment: Alignment.bottomLeft,
                  value: e.id,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      e.getName(),
                      maxLines: 1,
                    ),
                  ),
                ))
            .toList(),
        onChanged: enabled ? updateValue : null),
  );
}

Widget customExtDropDown(
    List<dynamic> myList, int? myValue, Function(int?) updateValue,
    {bool isExpanded = false,
    bool enabled = true,
    bool error = false,
    double width = 200}) {
  List<int> myValues = myList.map<int>((e) => e.id).toList();
  print("Dropdown initial $myValue in $myValues");
  return Container(
    alignment: Alignment.center,
    width: width,
    height: Responsive.tileNormal * 0.6,
    child: DropdownButton<int>(
        alignment: Alignment.bottomLeft,
        isExpanded: true,
        value: myValue,
        underline: const SizedBox.shrink(),
        // iconEnabledColor: const Color(0xffbc171d),
        items: myList
            .map((e) => DropdownMenuItem<int>(
                  alignment: Alignment.bottomLeft,
                  value: e.id,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      e.getName(),
                      maxLines: 1,
                    ),
                  ),
                ))
            .toList(),
        onChanged: enabled ? updateValue : null),
  );
}
