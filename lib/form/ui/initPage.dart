import 'package:flutter/material.dart';
import 'package:vento_form_flutter/responsive.dart';
import 'package:vento_form_flutter/form/models/extensions.dart';
import 'package:vento_form_flutter/form/components/button.dart';
import 'package:vento_form_flutter/form/components/header.dart';
import 'package:vento_form_flutter/form/components/spacers.dart';
import 'package:vento_form_flutter/form/components/genericDropdown.dart';

class InitPage extends StatefulWidget {
  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  String rawNumber = "";

  @override
  Widget build(BuildContext context) {
    final mdq = MediaQuery.of(context).size;
    Responsive.initSizes(mdq.width, mdq.height);
    double hei = Responsive.height - Responsive.headerHeight;
    return Scaffold(
      body: SizedBox(
        height: Responsive.height,
        width: Responsive.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Header(),
            SizedBox(
              width: Responsive.width,
              height: hei,
              child: Row(
                children: [
                  SizedBox(
                    width: Responsive.width / 2,
                    height: hei,
                    child: Column(
                      children: [
                        verticalSpace,
                        verticalSpace,
                        verticalSpace,
                        verticalSpace,
                        Text(
                          "Quiero un Crédito Nuevo.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: Responsive.font02),
                        ),
                        verticalSpace,
                        verticalSpace,
                        verticalSpace,
                        customButton(rawNumber == "" ? "Comenzar" : "Continuar",
                            () {
                          Navigator.of(context).pushNamed("/form_0");
                        }, highlight: true),
                        verticalSpace,
                        verticalSpace,
                        verticalSpace,
                        verticalSpace,
                        verticalSpace,
                        verticalSpace,
                        Text(
                          "Continuar Con Mi Solicitud.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: Responsive.font02),
                        ),
                        verticalSpace,
                        verticalSpace,
                        verticalSpace,
                        Container(
                          height: Responsive.buttonHeight,
                          width: Responsive.buttonWidth * 4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  Responsive.buttonHeight / 2))),
                          child: Container(
                            height: Responsive.buttonHeight,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(Responsive.buttonHeight / 2)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.5), //color of shadow
                                  spreadRadius: 5, //spread radius
                                  blurRadius: 7, // blur radius
                                  offset: const Offset(0, 2),
                                  //first paramerter of offset is left-right
                                  //second parameter is top to down
                                ),
                                //you can set more BoxShadow() here
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                horizontalSpace,
                                Image.asset(
                                  'assets/icons/mexico_flag.png',
                                  width: 32,
                                ),
                                customExtDropDown(myExtensions, myExtensionId,
                                    (p0) {
                                  setState(() {
                                    myExtensionId = p0 ?? 1;
                                  });
                                }, width: 92),
                                Expanded(
                                    child: TextField(
                                  maxLength: 10,
                                  maxLines: 1,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      counter: SizedBox.shrink()),
                                  onChanged: (val) {
                                    setState(() {
                                      rawNumber = val;
                                    });
                                  },
                                )),
                                horizontalSpace
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Responsive.width / 2,
                    height: hei,
                    child: Image.asset(
                      'assets/images/logo_big.png',
                      height: hei,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
