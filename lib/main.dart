import 'package:flutter/material.dart';
import 'package:infigon_design/UI/dashboard_screen.dart';
import 'package:infigon_design/UI/login_screen.dart';

import 'UI/dashboard_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
      routes: {
        DashboardScreen.id: (context) => DashboardScreen(),
        LoginScreen.id: (context) => LoginScreen(),
      },
    ),
  );
}
