import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/email_login_screen.dart';
import 'screens/phone_login_screen.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => LoginScreen(),
  EmailLoginScreen.routeName: (context) => EmailLoginScreen(),
  PhoneLoginScreen.routeName: (context) => PhoneLoginScreen(),
};
