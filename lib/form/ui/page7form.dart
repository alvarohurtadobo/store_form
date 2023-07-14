import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vento_form_flutter/responsive.dart';
import 'package:vento_form_flutter/form/components/clock.dart';
import 'package:vento_form_flutter/form/components/toast.dart';
import 'package:vento_form_flutter/form/components/header.dart';
import 'package:vento_form_flutter/form/components/button.dart';
import 'package:vento_form_flutter/form/models/personModel.dart';
import 'package:vento_form_flutter/form/components/spacers.dart';
import 'package:vento_form_flutter/form/components/stepper.dart';
import 'package:vento_form_flutter/form/components/otpPiece.dart';

class Page7Form extends StatefulWidget {
  const Page7Form({super.key});

  @override
  State<Page7Form> createState() => _Page4FormState();
}

class _Page4FormState extends State<Page7Form> {
  bool acepted = false;
  String otpCode = "";
  int seconds = 300;
  late Timer myTimer;

  @override
  void initState() {
    myTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        seconds--;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mdq = MediaQuery.of(context).size;
    Responsive.initSizes(mdq.width, mdq.height);
    return Scaffold(
      body: SizedBox(
        height: Responsive.height,
        width: Responsive.width,
        child: Column(
          children: [
            Header(),
            const MyStepper(
              currentPage: 7,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                          value: acepted,
                          onChanged: (newVal) {
                            setState(() {
                              acepted = newVal ?? false;
                            });
                          }),
                      Text("He leido y acepto los "),
                      Text("términos y condiciones "),
                    ],
                  ),
                  verticalSpace,
                  Text("Código OTP"),
                  Row(
                    children: [
                      otpPiece(),
                      otpPiece(),
                      otpPiece(),
                      otpPiece(),
                      otpPiece(),
                      otpPiece(),
                      clock(seconds)
                    ],
                  ),
                  Text(
                      "Ingresa el código de 6 dígitos que te mandamos a tu teléfono ${myCurrentPerson.phoneNumber}"),
                  Text(
                      "Si no sirve el codigo que ingresaste, espera a que acabe el tiempo para generar otro codigo"),
                  customButton("Generar código", () {
                    // Navigator.of(context).pop();
                  }, highlight: true),
                ],
              ),
            ),
            SizedBox(
              height: Responsive.height * 0.2,
              width: Responsive.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customButton("Regresar", () {
                    Navigator.of(context).pop();
                  }),
                  customButton("Finalizar", () {
                    if (otpCode == "") {
                      showToast("Es necesario introducir el código OTP", true);
                      return;
                    }
                    if (acepted) {
                      showToast(
                          "Es necesario aceptar los términos y condiciones",
                          true);
                      return;
                    }
                  }, highlight: true)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
