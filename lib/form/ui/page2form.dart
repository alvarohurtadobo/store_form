import 'package:flutter/material.dart';
import 'package:vento_form_flutter/responsive.dart';
import 'package:vento_form_flutter/form/components/toast.dart';
import 'package:vento_form_flutter/form/components/header.dart';
import 'package:vento_form_flutter/form/components/button.dart';
import 'package:vento_form_flutter/form/components/spacers.dart';
import 'package:vento_form_flutter/form/models/personModel.dart';
import 'package:vento_form_flutter/form/components/stepper.dart';
import 'package:vento_form_flutter/form/models/addressModel.dart';
import 'package:vento_form_flutter/form/components/genericDropdown.dart';
import 'package:vento_form_flutter/form/components/genericTextInput.dart';

class Page2Form extends StatefulWidget {
  const Page2Form({super.key});

  @override
  State<Page2Form> createState() => _Page2FormState();
}

class _Page2FormState extends State<Page2Form> {
  @override
  Widget build(BuildContext context) {
    final mdq = MediaQuery.of(context).size;
    Responsive.initSizes(mdq.width, mdq.height);
    myAddressModel.personId = myCurrentPerson.id;
    return Scaffold(
      body: SizedBox(
        height: Responsive.height,
        width: Responsive.width,
        child: Column(
          children: [
            Header(),
            const MyStepper(
              currentPage: 2,
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
                          "Info de Domicilio",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        verticalSpace,
                        genericTextInput("Calle", (newName) {
                          myAddressModel.street = newName;
                        }),
                        verticalSpace,
                        genericTextInput("Numero Interior", (newName) {
                          myAddressModel.internalNumber = newName;
                        }),
                        verticalSpace,
                        genericTextInput("Colonia", (newName) {
                          myAddressModel.zone = newName;
                        }),
                        verticalSpace,
                        genericTextInput("Estado", (newName) {
                          myAddressModel.state = newName;
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
                          "",
                          style: TextStyle(color: Colors.grey),
                        ),
                        verticalSpace,
                        genericTextInput("Número Exterior", (newName) {
                          myAddressModel.externalNumber = newName;
                        }),
                        verticalSpace,
                        genericTextInput("Código Postal", (newName) {
                          myAddressModel.zipCode = newName;
                        }),
                        verticalSpace,
                        genericTextInput("Municipio", (newName) {
                          myAddressModel.city = newName;
                        }),
                        verticalSpace,
                        genericTextInput("País", (newName) {
                          myAddressModel.country = newName;
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
                          "Estancia",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        verticalSpace,
                        genericTextInput("Años viviendo en Hogar", (newName) {
                          myAddressModel.yearsLiving = int.tryParse(newName);
                        }),
                        verticalSpace,
                        verticalSpace,
                        const Text(
                          "Tipo de vivienda",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        verticalSpace,
                        customDropDown(myHomeTypes, myHomeTypeId, (newType) {
                          setState(() {
                            myHomeTypeId = newType ?? 0;
                            myAddressModel.homeType = myHomeTypes.firstWhere((element) => element.id == myHomeTypeId);
                          });
                        }, width: Responsive.width * 0.28),
                        verticalSpace,
                        genericTextInput("Tipo de vivienda otro", (newName) {
                          myAddressModel.otherHomeType = newName;
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
                        "Creating address for ${myAddressModel.toJson()}");
                    if (!myAddressModel.isReady()) {
                      showToast("Todos los campos son obligatorios", true);
                    } else {
                      Navigator.of(context).pushNamed("/form_3");
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
