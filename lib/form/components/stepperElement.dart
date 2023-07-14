import 'package:flutter/material.dart';
import 'package:vento_form_flutter/responsive.dart';

List<String> stepperElements = [
  "motorcycle",
  "card",
  "house",
  "work",
  "money",
  "references",
  "documents",
  "warning"
];
List<String> stepperLabels = [
  "Seleccionar Modelo",
  "Datos Personales",
  "Domicilio Actual",
  "Empleo Actual",
  "Ingresos y Gastos",
  "Referencias",
  "Documentos",
  "Términos y Condiciones"
];

Widget stepperElement(int elementNumber, int globalElementNumber) {
  String assetColor = "grey";
  Color textColor = Colors.grey;
  if (elementNumber == globalElementNumber) {
    assetColor = "green";
    textColor = Colors.green;
  }
  if (elementNumber < globalElementNumber) {
    assetColor = "blue";
    textColor = Colors.blue;
  }
  String assetName = "${stepperElements[elementNumber]}_$assetColor.png";
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      elementNumber == 0
          ? const SizedBox.shrink()
          : Container(
              height: 4,
              width: 20,
              color: (elementNumber == globalElementNumber)
                  ? Colors.green
                  : (elementNumber < globalElementNumber)
                      ? Colors.blue
                      : Colors.grey[100],
            ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/icons/$assetName",
            height: Responsive.buttonHeight,
          ),
          Text(
            stepperLabels[elementNumber],
            style: TextStyle(color: textColor, fontSize: Responsive.font10),
          )
        ],
      ),
    ],
  );
}
