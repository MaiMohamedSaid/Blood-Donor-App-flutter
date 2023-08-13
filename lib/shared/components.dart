import 'package:flutter/material.dart';

import '../util/color_resources.dart';

Widget DefaultButton({
  double width = 180.0,
  double height = 160.0,
  Color backgroundColor = Colors.white,
  Color color = ColorResources.mainColor,
  required String text,
  required VoidCallback function,
  double FontStyle = 28.0,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: FontStyle,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required Function validate,
  required String labelName,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelName,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(suffix))
            : null,
      ),
      validator: validate(),
    );

Widget DefaultPost() => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "User Name",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Text(
                  "City",
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  "State",
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Available from 10:00 AM to 05:00 Pm',
            ),
          ],
        ),
      ),
    );
