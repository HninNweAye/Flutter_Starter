import 'package:flutter/material.dart';
import 'package:ismp_starter/ui/screens/login_screen.dart';

const String loginScreen = 'login';
const String responsiveUI = 'responsive_layout';

Route<dynamic> routes(RouteSettings settings) {
  switch (settings.name) {
    case loginScreen:
      // ignore: lines_longer_than_80_chars
      return MaterialPageRoute<dynamic>(
          builder: (context) => const LoginScreen());
    default:
      throw Exception('this route name does not exist.');
  }
}
