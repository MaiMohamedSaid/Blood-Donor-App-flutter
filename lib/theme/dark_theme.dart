import 'package:flutter/material.dart';

ThemeData dark = ThemeData(

  // fontFamily: 'TitilliumWeb',
  primaryColor: Color(0xff548E7F),
  primarySwatch: Colors.red,
  brightness: Brightness.dark,
  highlightColor: Color(0xFF252525),
  hintColor: Color(0xFFc7c7c7),
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
  }),
);
