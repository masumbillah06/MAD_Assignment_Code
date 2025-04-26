import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'themes/custom_theme.dart';

void main() {
  runApp(StudentPortalApp());
}

class StudentPortalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Portal',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: LoginPage(),
    );
  }
}
