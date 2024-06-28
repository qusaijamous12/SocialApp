import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme()=>ThemeData(
    primarySwatch: Colors.red,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 18,
            fontFamily: 'jannah'
        )
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.white
        ),
        elevation: 0
    )
);