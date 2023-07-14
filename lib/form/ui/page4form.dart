import 'package:flutter/material.dart';
import 'package:vento_form_flutter/responsive.dart';
import 'package:vento_form_flutter/form/components/toast.dart';
import 'package:vento_form_flutter/form/components/header.dart';
import 'package:vento_form_flutter/form/components/button.dart';
import 'package:vento_form_flutter/form/components/spacers.dart';
import 'package:vento_form_flutter/form/models/personModel.dart';
import 'package:vento_form_flutter/form/components/stepper.dart';
import 'package:vento_form_flutter/form/components/genericDropdown.dart';
import 'package:vento_form_flutter/form/components/genericTextInput.dart';

class Page4Form extends StatefulWidget {
  const Page4Form({super.key});

  @override
  State<Page4Form> createState() => _Page4FormState();
}

class _Page4FormState extends State<Page4Form> {
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
              currentPage: 4,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Responsive.width / 2,
                    height: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Ingresos y Gastos",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        verticalSpace,
                        genericTextInput("Ingreso Mensual", (newName) {
                          myCurrentPerson.monthlyIncome =
                              double.tryParse(newName) ?? 0.0;
                        }),
                        verticalSpace,
                        genericTextInput("Gasto Mensual", (newName) {
                          myCurrentPerson.monthlyOutcome =
                              double.tryParse(newName) ?? 0.0;
                        }),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Responsive.width / 2,
                    height: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Enganche",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        verticalSpace,
                        genericTextInput("Qué monto puedes pagar de enganche?",
                            (newName) {
                          myCurrentPerson.initialDownPaymentAmount =
                              double.tryParse(newName) ?? 0.0;
                        }),
                        verticalSpace,
                        customDropDown(
                            myInitialPaymentMethods, myInitialPaymentMethodId,
                            (p0) {
                          setState(() {
                            myInitialPaymentMethodId = p0 ?? 0;
                            myCurrentPerson.initialDownPaymentMethod =
                                myInitialPaymentMethods
                                    .firstWhere((element) =>
                                        element.id == myInitialPaymentMethodId)
                                    .name;
                          });
                        }, width: Responsive.width * 0.28)
                      ],
                    ),
                  )
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
                        "Updating person for ${myCurrentPerson.toJsonSecondEndpoint()}");
                    if (!myCurrentPerson.isReadyForPage5()) {
                      showToast("Todos los campos son obligatorios", true);
                    } else {
                      Navigator.of(context).pushNamed("/form_5");
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
