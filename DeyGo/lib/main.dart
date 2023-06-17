import 'package:deygo/components/inputs/inputs.dart';
import 'package:deygo/screens/account_setup/fill_profile.dart';
import 'package:deygo/screens/account_setup/verify_account.dart';
import 'package:deygo/screens/authentication/create_account.dart';
import 'package:deygo/screens/authentication/get_in_screen.dart';
import 'package:deygo/screens/authentication/login.dart';
import 'package:deygo/screens/bookings_and_payments/dashboard.dart';
import 'package:deygo/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DeyGo',
      theme: AppTheme.theme,
      home: const Dashboard(),
    );
  }
}
