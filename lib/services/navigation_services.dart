import 'package:flutter/cupertino.dart';

class NavigationServices {
  final GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {dynamic arg}) {
    return navigatorKey!.currentState!.pushNamed(routeName, arguments: arg);
  }

  Future<dynamic> navigateToReplacement(String routeName, {dynamic arg}) {
    return navigatorKey!.currentState!
        .pushReplacementNamed(routeName, arguments: arg);
  }

  Future<dynamic>? navigateToReplacementUntil(String? routeName,
      {dynamic arg}) {
    return navigatorKey!.currentState?.pushNamedAndRemoveUntil(
        routeName!, (Route route) => false,
        arguments: arg);
  }

  void goBack() {
    return navigatorKey!.currentState!.pop();
  }

//  Navigator.push(
//                             context,
//                             PageRouteBuilder(
//                               transitionDuration: Duration(seconds: 1),
//                               pageBuilder:
//                                   (context, animation, secondaryAnimation) =>
//                                   PayScreen(),
//                               transitionsBuilder: (context, animation,
//                                   secondaryAnimation, child) {
//                                 animation = CurvedAnimation(
//                                     parent: animation,
//                                     curve: Curves.bounceInOut);
//                                 return ScaleTransition(
//                                     scale: animation,
//                                     child: child,
//                                     alignment: Alignment.center);
//                               },
//                             ),
//                           );
}
