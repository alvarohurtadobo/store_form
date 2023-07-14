import 'package:flutter/material.dart';
import 'package:vento_form_flutter/responsive.dart';

List<String> myList = ["+54", "+591", "+1"];

Widget startPhoneInput() {
  String currentExtension = "+54";
  return Container(
    height: Responsive.buttonHeight,
    width: Responsive.buttonWidth * 4,
    decoration: BoxDecoration(
        borderRadius:
            BorderRadius.all(Radius.circular(Responsive.buttonHeight / 2))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/icons/mexico_flag.png'),
        DropdownButton<String>(
            alignment: Alignment.centerRight,
            isExpanded: true,
            value: currentExtension,
            underline: Container(),
            // iconEnabledColor: const Color(0xffbc171d),
            items: myList
                .map((e) => DropdownMenuItem<String>(
                      alignment: Alignment.bottomLeft,
                      value: e,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                            height: Responsive.buttonHeight / 2,
                            child: Text(
                              e,
                              maxLines: 1,
                            )),
                      ),
                    ))
                .toList(),
            onChanged: (newVal) {
              currentExtension = newVal ?? "";
            }),
        const TextField(
          textAlign: TextAlign.left,
          decoration: InputDecoration(
              hintText: "Ingresa tu teléfono", border: InputBorder.none),
        )
      ],
    ),
  );
}
