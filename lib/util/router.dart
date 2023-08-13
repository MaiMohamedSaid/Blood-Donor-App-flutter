import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // final List arg = settings.arguments;
  switch (settings.name) {
    // case SplashScreen.routeName:
    //   return CupertinoPageRoute(builder: (ctx) => SplashScreen());
    // case LoginScreen.routeName:
    //   return CupertinoPageRoute(builder: (ctx) => LoginScreen());
    // case BaseUrlScreen.routeName:
    //   return CupertinoPageRoute(builder: (ctx) => BaseUrlScreen());
    // case OpenShiftScreen.routeName:
    //   return CupertinoPageRoute(builder: (ctx) => OpenShiftScreen());
    // case HomeScreen.routeName:
    //   return CupertinoPageRoute(builder: (ctx) => HomeScreen());
    // case AccountsScreen.routeName:
    //   return CupertinoPageRoute(builder: (ctx) => AccountsScreen());
    // case FormAccountScreen.routeName:
    //   return CupertinoPageRoute(builder: (ctx) => FormAccountScreen());
    // case BaseUrlQrWidget.routeName:
    //   return CupertinoPageRoute(builder: (ctx) => BaseUrlQrWidget());
    // case CartScreen.routeName:
    //   return CupertinoPageRoute(builder: (ctx) => CartScreen());
    // case GeneralScreen.routeName:
    //   return CupertinoPageRoute(builder: (ctx) => GeneralScreen());
    // case LayoutItemsScreen.routeName:
    //   return CupertinoPageRoute(builder: (ctx) => LayoutItemsScreen());
    // case SettingsScreen.routeName:
    //   return CupertinoPageRoute(builder: (ctx) => SettingsScreen());
    // case CloseShiftScreen.routeName:
    //   return CupertinoPageRoute(builder: (ctx) => CloseShiftScreen());
    // case InvoicesSuspendScreen.routeName:
    //   return CupertinoPageRoute(builder: (ctx) => InvoicesSuspendScreen());
    // case InvoiceScreen.routeName:
    //   return CupertinoPageRoute(builder: (ctx) => InvoiceScreen());
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }
}
