import 'package:flutter/material.dart';
import 'package:vento_form_flutter/responsive.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Header ${Responsive.headerHeight}, ${Responsive.width}, ${Responsive.headerHeight / 2}");
    return Container(
      height: Responsive.headerHeight,
      width: Responsive.width,
      padding: EdgeInsets.symmetric(horizontal: Responsive.padding),
      color: Colors.black,
      alignment: Alignment.centerLeft,
      child: Image.asset(
        'assets/images/logo_white.png',
        height: Responsive.headerHeight / 2,
      ),
    );
  }
}
