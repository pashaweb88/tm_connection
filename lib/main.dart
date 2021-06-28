import 'package:flutter/material.dart';
import 'package:tm_connections/connection_page.dart';
import 'package:tm_connections/subscribtion_page.dart';
import 'package:tm_connections/welcome_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'tmv8connetion',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => SubscribtionPage(),
          '/welcome': (context) => WelcomePage(),
          '/main': (context) => ConnectionPage(),
        },
        initialRoute: '/main');
  }
}
