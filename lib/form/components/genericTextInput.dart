import 'package:flutter/material.dart';
import 'package:vento_form_flutter/form/models/personModel.dart';
import 'package:vento_form_flutter/responsive.dart';

Widget genericTextInput(String hint, Function(String) action) {
  return Container(
    height: Responsive.buttonHeight,
    width: Responsive.width * 0.28,
    padding: EdgeInsets.symmetric(horizontal: Responsive.padding),
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
        border: Border.all(color: Colors.grey),
        borderRadius:
            BorderRadius.all(Radius.circular(Responsive.bigButtonSize / 2))),
    child: TextField(
      onChanged: action,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        border: InputBorder.none,
      ),
    ),
  );
}

Widget genericDateInput(
    BuildContext context, String hint, Function(DateTime?) action) {
  TextEditingController contr = TextEditingController();
  if (myCurrentPerson.birthday != null) {
    contr.text = myCurrentPerson.birthday!.toIso8601String().substring(0, 10);
  }
  return GestureDetector(
    onTap: () async {
      DateTime? myDate = await datePicker(context, DateTime(1990, 1, 1));
      action(myDate);
      if (myDate != null) {
        contr.text = myDate.toIso8601String().substring(0, 10);
      }
    },
    child: Container(
      height: Responsive.buttonHeight,
      width: Responsive.width * 0.28,
      padding: EdgeInsets.symmetric(horizontal: Responsive.padding),
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
          border: Border.all(color: Colors.grey),
          borderRadius:
              BorderRadius.all(Radius.circular(Responsive.bigButtonSize / 2))),
      child: TextField(
        controller: contr,
        enabled: false,
        decoration: InputDecoration(
          suffixIcon: const Icon(
            Icons.calendar_month,
            color: Colors.blueAccent,
          ),
          hintText: hint,
          hintStyle:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    ),
  );
}

Future<DateTime?> datePicker(BuildContext context, DateTime initialDate) async {
  return showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900, 1, 1),
      lastDate: DateTime(2024, 1, 1));
}
