import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import 'package:http/http.dart' as http;
import './provider/countires.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Countries(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.indigo,
          accentColor: Colors.indigoAccent,
          iconTheme: ThemeData.light().iconTheme.copyWith(
            color: Colors.white
          ),
          textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              fontSize: 20,
            ),
            bodyText2: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
                fontFamily: 'Raleway',

            ),

          ),

          visualDensity: VisualDensity.adaptivePlatformDensity,

        ),
        routes: {
          '/': (context)=>HomeScreen(),
        },
      ),
    );
  }
}


