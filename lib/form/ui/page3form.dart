import 'package:flutter/material.dart';
import 'package:vento_form_flutter/responsive.dart';
import 'package:vento_form_flutter/form/components/toast.dart';
import 'package:vento_form_flutter/form/components/header.dart';
import 'package:vento_form_flutter/form/components/button.dart';
import 'package:vento_form_flutter/form/components/spacers.dart';
import 'package:vento_form_flutter/form/models/personModel.dart';
import 'package:vento_form_flutter/form/components/stepper.dart';
import 'package:vento_form_flutter/form/models/companyModel.dart';
import 'package:vento_form_flutter/form/models/addressModel.dart';
import 'package:vento_form_flutter/form/components/genericDropdown.dart';
import 'package:vento_form_flutter/form/components/genericTextInput.dart';

class Page3Form extends StatefulWidget {
  const Page3Form({super.key});

  @override
  State<Page3Form> createState() => _Page3FormState();
}

class _Page3FormState extends State<Page3Form> {
  @override
  Widget build(BuildContext context) {
    final mdq = MediaQuery.of(context).size;
    Responsive.initSizes(mdq.width, mdq.height);
    myCompanyModel.personId = myCurrentPerson.id;
    return Scaffold(
      body: SizedBox(
        height: Responsive.height,
        width: Responsive.width,
        child: Column(
          children: [
            Header(),
            const MyStepper(
              currentPage: 3,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Responsive.width / 3,
                    height: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Información de la empresa",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        verticalSpace,
                        genericTextInput("Nombre de la empresa donde trabajó",
                            (newName) {
                          myCompanyModel.name = newName;
                        }),
                        verticalSpace,
                        customDropDown(myLaborOlds, myLaborOldId, (p0) {
                          setState(() {
                            myLaborOldId = p0 ?? 0;
                            myCompanyModel.laborOld = myLaborOlds.firstWhere(
                                (element) => element.id == myLaborOldId);
                          });
                        }, width: Responsive.width * 0.28),
                        verticalSpace,
                        genericTextInput("Nombre y Apellido del jefe inmediato",
                            (newName) {
                          myCompanyModel.lastBossName = newName;
                        }),
                        verticalSpace,
                        genericTextInput("Número de teléfono del Empleo actual",
                            (newName) {
                          myCompanyModel.phoneNumber = newName;
                        }),
                        verticalSpace,
                        customDropDown(myCompanyActivities, myCompanyActivityId,
                            (p0) {
                          setState(() {
                            myCompanyActivityId = p0 ?? 0;
                            myCompanyModel.activity =
                                myCompanyActivities.firstWhere((element) =>
                                    element.id == myCompanyActivityId);
                          });
                        }, width: Responsive.width * 0.28)
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
                          "Dirección de trabajo",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        verticalSpace,
                        genericTextInput("Calle", (newName) {
                          myWorkAddressModel.street = newName;
                        }),
                        verticalSpace,
                        genericTextInput("Número Interior", (newName) {
                          myWorkAddressModel.internalNumber = newName;
                        }),
                        verticalSpace,
                        genericTextInput("Colonia", (newName) {
                          myWorkAddressModel.zone = newName;
                        }),
                        verticalSpace,
                        genericTextInput("Estado", (newName) {
                          myWorkAddressModel.state = newName;
                        }),
                        verticalSpace,
                        customDropDown(myCharges, myChargeId, (p0) {
                          setState(() {
                            myChargeId = p0 ?? 0;
                            myCompanyModel.charge = myCharges.firstWhere(
                                (element) => element.id == myChargeId);
                          });
                        }, width: Responsive.width * 0.28)
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
                          "",
                          style: TextStyle(color: Colors.grey),
                        ),
                        verticalSpace,
                        genericTextInput("Número Exterior", (newName) {
                          myWorkAddressModel.externalNumber = newName;
                        }),
                        verticalSpace,
                        genericTextInput("Código postal", (newName) {
                          myWorkAddressModel.zipCode = newName;
                        }),
                        verticalSpace,
                        genericTextInput("Municipio", (newName) {
                          myWorkAddressModel.city = newName;
                        }),
                        verticalSpace,
                        genericTextInput("País", (newName) {
                          myWorkAddressModel.country = newName;
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
                    print("Creating company for ${myCompanyModel.toJson()}");
                    print(
                        "Creating address company for ${myWorkAddressModel.toJson()}");
                    if (!myCompanyModel.isReady()) {
                      showToast("Todos los campos son obligatorios", true);
                    } else {
                      Navigator.of(context).pushNamed("/form_4");
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
