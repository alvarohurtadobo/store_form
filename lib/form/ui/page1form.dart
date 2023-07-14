import 'package:flutter/material.dart';
import 'package:vento_form_flutter/responsive.dart';
import 'package:vento_form_flutter/form/components/toast.dart';
import 'package:vento_form_flutter/form/components/header.dart';
import 'package:vento_form_flutter/form/components/button.dart';
import 'package:vento_form_flutter/form/models/civilStatus.dart';
import 'package:vento_form_flutter/form/models/nationality.dart';
import 'package:vento_form_flutter/form/components/spacers.dart';
import 'package:vento_form_flutter/form/models/personModel.dart';
import 'package:vento_form_flutter/form/components/stepper.dart';
import 'package:vento_form_flutter/form/components/genericDropdown.dart';
import 'package:vento_form_flutter/form/components/genericTextInput.dart';

class Page1Form extends StatefulWidget {
  const Page1Form({super.key});

  @override
  State<Page1Form> createState() => _Page1FormState();
}

class _Page1FormState extends State<Page1Form> {
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
              currentPage: 1,
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
                          "Info Básica",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        verticalSpace,
                        genericTextInput("Nombre", (newName) {
                          myCurrentPerson.name = newName;
                        }),
                        verticalSpace,
                        genericTextInput("Apellido Paterno", (newName) {
                          myCurrentPerson.firstLastName = newName;
                        }),
                        verticalSpace,
                        genericTextInput("Apellido Materno", (newName) {
                          myCurrentPerson.secondLastName = newName;
                        }),
                        verticalSpace,
                        genericDateInput(context, "Fecha de Nacimiento",
                            (newDate) {
                          myCurrentPerson.birthday = newDate;
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
                          "Responsabilidad",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        verticalSpace,
                        customDropDown(myCivilStatuses, myCivilStatusId, (p0) {
                          setState(() {
                            myCivilStatusId = p0 ?? 0;
                            myCurrentPerson.civilStatus = myCivilStatuses
                                .firstWhere(
                                    (element) => element.id == myCivilStatusId)
                                .name;
                          });
                        }, width: Responsive.width * 0.28),
                        verticalSpace,
                        customDropDown(myMarriageTypees, myMarriageTypeId,
                            (p0) {
                          setState(() {
                            myMarriageTypeId = p0 ?? 0;
                            myCurrentPerson.marriageType = myMarriageTypees
                                .firstWhere(
                                    (element) => element.id == myMarriageTypeId)
                                .name;
                          });
                        }, width: Responsive.width * 0.28),
                        verticalSpace,
                        genericTextInput("Número de Dependientes", (newName) {
                          myCurrentPerson.dependents = int.tryParse(newName);
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
                          "Contacto",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        verticalSpace,
                        genericTextInput("Teléfono de Casa", (newName) {
                          myCurrentPerson.homePhoneNumber = newName;
                        }),
                        verticalSpace,
                        genericTextInput("Teléfono Celular", (newName) {
                          myCurrentPerson.phoneNumber = newName;
                        }),
                        verticalSpace,
                        genericTextInput("Email", (newName) {
                          myCurrentPerson.email = newName;
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                height: Responsive.height * 0.2,
                child: Row(
                  children: [
                    SizedBox(
                      width: Responsive.width / 3,
                      height: double.infinity,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: Responsive.width * 0.28,
                            child: const Text(
                              "Sexo",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          verticalSpace,
                          SizedBox(
                            width: Responsive.width * 0.28,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                genderChip(Gender.MALE),
                                genderChip(Gender.FEMALE),
                                genderChip(Gender.OTHER),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Responsive.width / 3,
                      height: double.infinity,
                      child: Column(
                        children: [
                          const Text(
                            "Información Nacional",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          verticalSpace,
                          genericTextInput("RFC", (newName) {
                            myCurrentPerson.rfc = newName;
                          }),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Responsive.width / 3,
                      height: double.infinity,
                      child: Column(
                        children: [
                          const Text(
                            "",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          verticalSpace,
                          customDropDown(myNationalities, myNationalityId,
                              (p0) {
                            setState(() {
                              myNationalityId = p0 ?? 0;
                              myCurrentPerson.nationality = myNationalities
                                  .firstWhere((element) =>
                                      element.id == myNationalityId)
                                  .name;
                            });
                          }, width: Responsive.width * 0.28),
                        ],
                      ),
                    ),
                  ],
                )),
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
                        "Creating register for ${myCurrentPerson.toJsonFirstEndpoint()}");
                    if (!myCurrentPerson.isReadyForPage2()) {
                      showToast("Todos los campos son obligatorios", true);
                    } else {
                      Navigator.of(context).pushNamed("/form_2");
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

  Widget genderChip(Gender myGender) {
    bool selected = myCurrentPerson.gender == myGender.toString();
    String label = "Otro";
    if (myGender == Gender.FEMALE) {
      label = "Mujer";
    }
    if (myGender == Gender.MALE) {
      label = "Hombre";
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          myCurrentPerson.gender = myGender.toString();
        });
      },
      child: Container(
        height: Responsive.buttonHeight,
        width: Responsive.width * 0.08,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: selected ? Colors.blueAccent : Colors.grey,
            borderRadius: BorderRadius.all(
                Radius.circular(Responsive.bigButtonSize / 2))),
        child: Text(
          label,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
