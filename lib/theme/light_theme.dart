import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  // appBarTheme: AppBarTheme(
  //     backgroundColor: Colors.white,
  //     foregroundColor: Colors.white
  // ),
  fontFamily: 'TitilliumWeb',
  primaryColor: Color(0xff548E7F),
  primarySwatch: Colors.red,
  brightness: Brightness.light,
  highlightColor: Colors.white,
  hintColor: Color(0xFF9E9E9E),
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
  }),
);
