import 'package:flutter/material.dart';
import 'package:vento_form_flutter/responsive.dart';
import 'package:vento_form_flutter/form/components/toast.dart';
import 'package:vento_form_flutter/form/components/button.dart';
import 'package:vento_form_flutter/form/components/header.dart';
import 'package:vento_form_flutter/form/components/spacers.dart';
import 'package:vento_form_flutter/form/models/creditPlans.dart';
import 'package:vento_form_flutter/form/components/stepper.dart';
import 'package:vento_form_flutter/form/models/productModel.dart';
import 'package:vento_form_flutter/form/components/genericDropdown.dart';

class Page0Form extends StatefulWidget {
  const Page0Form({super.key});

  @override
  State<Page0Form> createState() => _Page0FormState();
}

class _Page0FormState extends State<Page0Form> {
  @override
  Widget build(BuildContext context) {
    final mdq = MediaQuery.of(context).size;
    Responsive.initSizes(mdq.width, mdq.height);
    double hei = Responsive.height - 2 * Responsive.headerHeight;
    return Scaffold(
      body: SizedBox(
        height: Responsive.height,
        width: Responsive.width,
        child: Column(
          children: [
            Header(),
            const Center(
              child: MyStepper(
                currentPage: 0,
              ),
            ),
            SizedBox(
              width: Responsive.width,
              height: hei,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Responsive.width / 2,
                    height: hei,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        verticalSpace,
                        verticalSpace,
                        Text(
                          "Yo Quiero Una...",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: Responsive.font02),
                        ),
                        verticalSpace,
                        verticalSpace,
                        verticalSpace,
                        customDropDown(myModels, currentModelId, (newVal) {
                          setState(() {
                            currentModelId = newVal ?? 0;
                          });
                        }, width: Responsive.width * 0.35),
                        verticalSpace,
                        verticalSpace,
                        verticalSpace,
                        customDropDown(myPlans, currentPlanId, (newVal) {
                          setState(() {
                            currentPlanId = newVal ?? 0;
                          });
                        }, width: Responsive.width * 0.35),
                        verticalSpace,
                        verticalSpace,
                        verticalSpace,
                        verticalSpace,
                        verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customButton("Regresar", () {
                              Navigator.of(context).pop();
                            }, highlight: true),
                            customButton("Siguiente", () {
                              if (currentModelId == 0 || currentPlanId == 0) {
                                showToast(
                                    "Por favor seleccione un modelo y un plan",
                                    true);
                              } else {
                                Navigator.of(context).pushNamed("/form_1");
                              }
                            }, highlight: true)
                          ],
                        )
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/images/moto_big.png",
                    height: Responsive.height * 0.65,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
