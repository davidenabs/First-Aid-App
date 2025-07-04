// main.dart
import 'package:first_aid_app/screens/categories_page.dart';
import 'package:first_aid_app/screens/detailed_first_aid_page.dart';
import 'package:first_aid_app/screens/home_page.dart';
import 'package:first_aid_app/screens/major_injuries_page.dart';
import 'package:first_aid_app/screens/minor_injuries_page.dart';
import 'package:first_aid_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'dart:async';

void main() {
  runApp(FirstAidApp());
}

class FirstAidApp extends StatelessWidget {
  const FirstAidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First Aid App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF4FC3F7),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF4FC3F7),
          secondary: Color(0xFF26A69A),
          error: Color(0xFFD32F2F),
        ),
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          bodyLarge: TextStyle(fontSize: 16),
          bodyMedium: TextStyle(fontSize: 14),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 56),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      home: SplashScreen(),
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/categories', page: () => CategoriesPage()),
        GetPage(name: '/major', page: () => MajorInjuriesPage()),
        GetPage(name: '/minor', page: () => MinorInjuriesPage()),
        GetPage(name: '/detail', page: () => DetailedFirstAidPage()),
      ],
    );
  }
}
