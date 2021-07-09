import 'package:flutter/material.dart';
import 'package:nccguide/Guide/CommonSubject.dart';
import 'package:nccguide/Guide/RedBook.dart';
import 'package:nccguide/Guide/SpecialisedSubjects.dart';
import 'package:nccguide/menu_page.dart';
import 'package:nccguide/nccSong.dart';
import 'package:nccguide/splash_page.dart';
import 'package:nccguide/workout2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NCC Guide',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
    scaffoldBackgroundColor: Color(0xFF081018),
    ),
      home: Splash(),
      routes: {
        'splash' : (context) => Splash(),
        'menu_page' : (context) => menuPage(),
        'nccSong' : (context) => nccSong(),
        'guide4' : (context) => redBook(),
        'guide3' : (context) => cSubject(),
        'guide2' : (context) => sSubjects(),
      },
    );
  }
}