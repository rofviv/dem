import 'package:flutter/material.dart';
import 'package:app_dem/pages/loginPage.dart';
import 'package:app_dem/pages/principalPage.dart';
import 'package:app_dem/pages/categoriesPage.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(primaryColor: Color(0xFF002b59)),
  initialRoute: '/',
  routes: {
    // '/': (context) => Loading(),
    '/': (context) => LoginPage(),
    '/principal': (context) => PrincipalPage(),
    '/categories': (context) => CategoriesPage()
  }
));