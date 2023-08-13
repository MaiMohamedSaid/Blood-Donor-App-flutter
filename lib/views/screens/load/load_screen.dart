// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:untitledtest11/views/screens/auth/auth_screen.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/section_provider.dart';
import '../dashboard/dashboard_screen.dart';


class LoadScreen extends StatefulWidget {
  @override
  State<LoadScreen> createState() => _LoadScreenState();
}
class _LoadScreenState extends State<LoadScreen> {
  @override
  void initState() {
    super.initState();
    _changePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Center(
        child: LoadingAnimationWidget.prograssiveDots(
          size: 100,
          color: Color(0xFFD6001B),
        ),
      ),
    );
  }

  _changePage() {
    Future.delayed(Duration(seconds: 3), () async {
      if (Provider.of<AuthProvider>(context, listen: false).isLoggedIn()) {
        Provider.of<SectionProvider>(context,listen: false).getSections(
            Provider.of<AuthProvider>(context,listen: false).userData!.token!,
        );
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => DashBoardScreen()));
      }
      else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => AuthScreen()), (route) => false);
      }
    });
  }
}
