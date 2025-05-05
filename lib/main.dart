import 'package:extracurricular_activities/pages/home_page.dart';
import 'package:extracurricular_activities/widgets/bottom_navigations.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = ThemeData(
      appBarTheme: AppBarTheme(
        color: Color.fromRGBO(255, 193, 135, 1)
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color.fromRGBO(255, 193, 135, 1),
        selectedLabelStyle: TextStyle(color: Colors.brown),
        unselectedLabelStyle: TextStyle(color:  Colors.brown[200]),
        selectedIconTheme: IconThemeData(
          color: Colors.brown,
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.brown[300],
        ),
      ),
      
    );
    return MaterialApp(
      title: 'Внеурочная деятельность',
      theme: themeData,
      home: BottomNavigations(),
    );
  }
}


