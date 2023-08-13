// ignore_for_file: constant_identifier_names, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/theme_provider.dart';

class ColorResources {
  static const mainColor = Color(0xFFd90430);
  static const secondColor = Colors.amberAccent;

  static const Color DEFAULT_COLOR = Color(0xff548E7F);
  static const Color BLACK = Color(0xff000000);
  static const Color WHITE = Color(0xffFFFFFF);
  static const Color GREY = Color(0xffF1F1F1);
  static const Color GREEN = Color(0xff0CC579);
  static const Color RED = Color(0xffDB0000);
  static const Color ORANGE = Color(0xffEF812D);
  static const Color BLUE = Colors.blue;
  static const Color switch_button = Color(0xff7BA43E);
  static const Color HINT_TEXT_COLOR = Color(0xff9e9e9e);
  static const Color ICON_BG = Color(0xffF9F9F9);
  static const Color IMAGE_BG = Color(0xffE2F0FF);
  static const Color SELLER_TXT = Color(0xff92C6FF);
  static const Color LOW_GREEN = Color(0xffEFF6FE);
  static const Color LIGHT_SKY_BLUE = Color(0xff8DBFF6);
  static var themeColor = hexToColor("#ffffff");

  static Color getSellerTxt(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? Color(0xFF517091)
        : Color(0xFF92C6FF);
  }

  static Color getGreen(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? Color(0xFF167d3c)
        : Color(0xFF23CB60);
  }

  static Color getTextTitle(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? Color(0xFFFFFFFF)
        : Color(0xFF333333);
  }

  static Color getYellow(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? Color(0xFF916129)
        : Color(0xFFFFAA47);
  }

  static Color getRed(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? Color(0xFF7a1c1c)
        : Color(0xFFD32F2F);
  }

  static Color getImageBg(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? Color(0xFF3f4347)
        : Color(0xFFE2F0FF);
  }

  static Color getLowGreen(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? Color(0xFF7d8085)
        : Color(0xFFEFF6FE);
  }

  static Color getTextBg(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? Color(0xFF414345)
        : Color(0xFFF3F9FF);
  }

  static Color getIconBg(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? Color(0xFF2e2e2e)
        : Color(0xFFF9F9F9);
  }

  static Color getHomeBg(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? Color(0xFF3d3d3d)
        : Color(0xFFf7f7f7);
  }

  static Color getGrey(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? Color(0xFF808080)
        : Color(0xFFF1F1F1);
  }

  static Color getGainsBoro(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? Color(0xFF999999)
        : Color(0xFFE6E6E6);
  }

  static Color getLightSkyBlue(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? Color(0xFFc7c7c7)
        : Color(0xFF8DBFF6);
  }

  static Color getHint(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? Color(0xFFc7c7c7)
        : Color(0xFF9E9E9E);
  }

  static Color getPrimary(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? Color(0xFFf0f0f0)
        : Theme.of(context).primaryColor;
  }

  static Color getColombiaBlue(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? Color(0xFF678cb5)
        : Color(0xFF92C6FF);
  }

  static Color getChatIcon(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? Color(0xFFebebeb)
        : Color(0xFFD4D4D4);
  }

  static Color getHarlequin(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? Color(0xFF257800)
        : Color(0xFF3FCC01);
  }

  static Color getCheris(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? Color(0xFF941546)
        : Color(0xFFE2206B);
  }

  static const Map<int, Color> colorMap = {
    50: Color(0x10192D6B),
    100: Color(0x20192D6B),
    200: Color(0x30192D6B),
    300: Color(0x40192D6B),
    400: Color(0x50192D6B),
    500: Color(0x60192D6B),
    600: Color(0x70192D6B),
    700: Color(0x80192D6B),
    800: Color(0x90192D6B),
    900: Color(0xff192D6B),
  };
}

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
