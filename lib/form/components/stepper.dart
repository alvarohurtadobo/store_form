import 'package:flutter/material.dart';
import 'package:vento_form_flutter/responsive.dart';
import 'package:vento_form_flutter/form/components/stepperElement.dart';

class MyStepper extends StatefulWidget {
  const MyStepper({Key? key, this.currentPage = 0}) : super(key: key);
  final int currentPage;
  @override
  State<MyStepper> createState() => _StepperState();
}

class _StepperState extends State<MyStepper> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.width * 0.9,
      height: Responsive.headerHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          stepperElement(0, widget.currentPage),
          stepperElement(1, widget.currentPage),
          stepperElement(2, widget.currentPage),
          stepperElement(3, widget.currentPage),
          stepperElement(4, widget.currentPage),
          stepperElement(5, widget.currentPage),
          stepperElement(6, widget.currentPage),
          stepperElement(7, widget.currentPage),
        ],
      ),
    );
  }
}
