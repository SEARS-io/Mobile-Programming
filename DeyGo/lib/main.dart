import 'dart:math';
import 'package:deygo/redux/reducers.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:deygo/components/inputs/inputs.dart';
import 'package:deygo/redux/app_state.dart';
import 'package:deygo/screens/account_setup/fill_profile.dart';
import 'package:deygo/screens/account_setup/verify_account.dart';
import 'package:deygo/screens/authentication/create_account.dart';
import 'package:deygo/screens/authentication/get_in_screen.dart';
import 'package:deygo/screens/authentication/login.dart';
import 'package:deygo/screens/dashboard/dashboard.dart';
import 'package:deygo/screens/profile/edit_profile.dart';
import 'package:deygo/screens/profile/profile.dart';
import 'package:deygo/screens/splash_screen/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Theme/theme.dart';

void main() {
  runApp(MyApp());
  FlutterError.onError = (details) {
    if (kDebugMode) {
      print(details);
    }
  };
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Store<AppState> _store = Store<AppState>(
    AppStateReducer,
    initialState: AppState(),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: _store,
      child: GetMaterialApp(
        title: 'DeyGo',
        theme: AppTheme.theme,
        home: const CreateAccount(),
      ),
    );
  }
}
