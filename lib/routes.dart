import 'package:flutter/material.dart';
import 'package:vento_form_flutter/form/ui/initPage.dart';
import 'package:vento_form_flutter/form/ui/form0page.dart';
import 'package:vento_form_flutter/form/ui/page1form.dart';
import 'package:vento_form_flutter/form/ui/page2form.dart';
import 'package:vento_form_flutter/form/ui/page3form.dart';
import 'package:vento_form_flutter/form/ui/page4form.dart';
import 'package:vento_form_flutter/form/ui/page5form.dart';
import 'package:vento_form_flutter/form/ui/page6form.dart';
import 'package:vento_form_flutter/form/ui/page7form.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments; // as List;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => InitPage());
      case "/form_0":
        return MaterialPageRoute(builder: (_) => Page0Form());
      case "/form_1":
        return MaterialPageRoute(builder: (_) => Page1Form());
      case "/form_2":
        return MaterialPageRoute(builder: (_) => Page2Form());
      case "/form_3":
        return MaterialPageRoute(builder: (_) => Page3Form());
      case "/form_4":
        return MaterialPageRoute(builder: (_) => Page4Form());
      case "/form_5":
        return MaterialPageRoute(builder: (_) => Page5Form());
      case "/form_6":
        return MaterialPageRoute(builder: (_) => Page6Form());
      case "/form_7":
        return MaterialPageRoute(builder: (_) => Page7Form());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        backgroundColor: Colors.white,
        // drawer: DrawerWidget(),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
