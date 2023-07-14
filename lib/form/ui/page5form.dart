import 'package:flutter/material.dart';
import 'package:vento_form_flutter/responsive.dart';
import 'package:vento_form_flutter/form/components/toast.dart';
import 'package:vento_form_flutter/form/components/header.dart';
import 'package:vento_form_flutter/form/components/button.dart';
import 'package:vento_form_flutter/form/components/spacers.dart';
import 'package:vento_form_flutter/form/models/personModel.dart';
import 'package:vento_form_flutter/form/components/stepper.dart';
import 'package:vento_form_flutter/form/models/refereeModel.dart';
import 'package:vento_form_flutter/form/components/genericTextInput.dart';

class Page5Form extends StatefulWidget {
  const Page5Form({super.key});

  @override
  State<Page5Form> createState() => _Page5FormState();
}

class _Page5FormState extends State<Page5Form> {
  @override
  Widget build(BuildContext context) {
    final mdq = MediaQuery.of(context).size;
    Responsive.initSizes(mdq.width, mdq.height);
    myReferee1.personId = myCurrentPerson.id;
    myReferee2.personId = myCurrentPerson.id;
    myReferee3.personId = myCurrentPerson.id;
    return Scaffold(
      body: SizedBox(
        height: Responsive.height,
        width: Responsive.width,
        child: Column(
          children: [
            Header(),
            const MyStepper(
              currentPage: 5,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Responsive.width / 3,
                    height: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Referencia 1",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        verticalSpace,
                        genericTextInput("Nombre y Apellidos", (newName) {
                          myReferee1.name = newName;
                        }),
                        verticalSpace,
                        genericTextInput("Teléfono (Con clave LADA)",
                            (newName) {
                          myReferee1.phone = newName;
                        }),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Responsive.width / 3,
                    height: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Referencia 2",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        verticalSpace,
                        genericTextInput("Nombre y Apellidos", (newName) {
                          myReferee2.name = newName;
                        }),
                        verticalSpace,
                        genericTextInput("Teléfono (Con clave LADA)",
                            (newName) {
                          myReferee2.phone = newName;
                        }),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Responsive.width / 3,
                    height: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Referencia 3",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        verticalSpace,
                        genericTextInput("Nombre y Apellidos", (newName) {
                          myReferee3.name = newName;
                        }),
                        verticalSpace,
                        genericTextInput("Teléfono (Con clave LADA)",
                            (newName) {
                          myReferee3.phone = newName;
                        }),
                      ],
                    ),
                  ),
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
                  customButton("Siguiente", () {
                    print(
                        "Updating referees for ${myReferee1.toJson()}; ${myReferee2.toJson()}; ${myReferee3.toJson()}");
                    if (!myCurrentPerson.isReadyForPage5()) {
                      showToast("Todos los campos son obligatorios", true);
                    } else {
                      Navigator.of(context).pushNamed("/form_6");
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
