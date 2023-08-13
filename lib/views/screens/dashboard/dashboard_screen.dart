// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:untitledtest11/localization/language_constrants.dart';
import 'package:untitledtest11/util/color_resources.dart';
import 'package:untitledtest11/views/screens/map/simple_map.dart';
import '../home/home_screen.dart';
import '../map/current_location.dart';
import '../map/search_places.dart';
import '../setting/setting.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}
class _DashBoardScreenState extends State<DashBoardScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: ColorResources.mainColor,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 35,
                ),
                label: (getTranslated("home", context)!)),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.location_on,
                size: 35,
              ),
              label: (getTranslated("map", context)!),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 35,
              ),
              label: (getTranslated("setting", context)!),
            ),
          ],
          onTap: (index) {
            currentIndex = index;
            setState(() {});
            print(currentIndex);
          },
        ),
        body: changePage(currentIndex));
  }

  Widget changePage(int current) {
    switch (current) {
      case 0:
        return HomeScreen();
      case 1:
        return SearchPlacesScreen();
      default:
        return Setting();
    }
  }
}
