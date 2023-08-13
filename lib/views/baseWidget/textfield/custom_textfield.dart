// // ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import '../../../util/textStyle.dart';
//
// extension EmailValidator on String {
//   bool isValidEmail() {
//     return RegExp(
//             r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
//         .hasMatch(this);
//   }
// }
//
// class CustomTextField extends StatelessWidget {
//   final TextEditingController? controller;
//   final String? hintText;
//   final String? labelText;
//   final TextInputType? textInputType;
//   final int? maxLine;
//   final FocusNode? focusNode;
//   final FocusNode? nextNode;
//   final TextInputAction? textInputAction;
//   final bool isPhoneNumber;
//   final bool isValidator;
//   final bool suffixUse;
//   final Widget? suffixIcon;
//   final Widget? prefixIcon;
//   final String? validatorMessage;
//   final Color? fillColor;
//   final TextCapitalization capitalization;
//   final TextDirection? textDirection;
//
//   CustomTextField({
//     this.controller,
//     this.hintText,
//     this.labelText,
//     this.textInputType,
//     this.maxLine,
//     this.focusNode,
//     this.nextNode,
//     this.textInputAction,
//     this.isPhoneNumber = false,
//     this.isValidator = false,
//     this.suffixUse = false,
//     this.suffixIcon,
//     this.prefixIcon,
//     this.validatorMessage,
//     this.capitalization = TextCapitalization.none,
//     this.fillColor,
//     this.textDirection,
//   });
//
//   @override
//   Widget build(context) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Theme.of(context).highlightColor,
//         borderRadius: BorderRadius.circular(6),
//         // boxShadow: [
//         //   BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 3, offset: Offset(0, 1)) // changes position of shadow
//         // ],
//       ),
//       child: TextFormField(
//         controller: controller,
//         maxLines: maxLine,
//         textCapitalization: capitalization,
//         maxLength: isPhoneNumber ? 15 : null,
//         textDirection: textDirection,
//         focusNode: focusNode,
//         keyboardType: textInputType ?? TextInputType.text,
//         initialValue: null,
//         textInputAction: textInputAction ?? TextInputAction.next,
//         onFieldSubmitted: (v) {
//           FocusScope.of(context).requestFocus(nextNode);
//         },
//         inputFormatters: [isPhoneNumber ? FilteringTextInputFormatter.digitsOnly : FilteringTextInputFormatter.singleLineFormatter],
//         validator: (input){
//           if(input!.isEmpty){
//             if(isValidator){
//               return validatorMessage ?? "";
//             }
//           }
//           return null;
//         },
//         decoration: InputDecoration(
//           hintText: hintText ?? '',
//           labelText: labelText ,
//           // filled: fillColor != null,
//           // fillColor: fillColor,
//           // contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
//           isDense: true,
//           counterText: '',
//           focusedBorder: OutlineInputBorder(),
//             // borderSide: BorderSide(color: Theme.of(context).primaryColor)
//           hintStyle: cairoRegular.copyWith(color: Theme.of(context).hintColor),
//           errorStyle: TextStyle(height: 1.5),
//           border:OutlineInputBorder(),
//           // InputBorder.none,
//           suffixIcon: suffixIcon,
//           prefixIcon: prefixIcon
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  // final String? hintText;
  final String? labelText;
  final TextInputType? textInputType;
  // final int? maxLine;
  // final FocusNode? focusNode;
  // final FocusNode? nextNode;
  // final TextInputAction? textInputAction;
  // final bool isPhoneNumber;
  final bool isValidator;
  final bool suffixUse;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? validatorMessage;
  // final Color? fillColor;
  // final TextCapitalization capitalization;
  // final TextDirection? textDirection;

  CustomTextField({
    this.controller,
    // this.hintText,
    this.labelText,
    this.textInputType,
    // this.maxLine,
    // this.focusNode,
    // this.nextNode,
    // this.textInputAction,
    // this.isPhoneNumber = false,
    this.isValidator = false,
    this.suffixUse = false,
    this.suffixIcon,
    this.prefixIcon,
    this.validatorMessage,
    // this.capitalization = TextCapitalization.none,
    // this.fillColor,
    // this.textDirection,
  });

  @override
  Widget build(context) {
    return TextFormField(
      controller: controller,
      // maxLines: maxLine,
      // textCapitalization: capitalization,
      // maxLength: isPhoneNumber ? 15 : null,
      // textDirection: textDirection,
      // focusNode: focusNode,
      keyboardType: textInputType ?? TextInputType.text,
      initialValue: null,
      // textInputAction: textInputAction ?? TextInputAction.next,
      // onFieldSubmitted: (v) {
      //   FocusScope.of(context).requestFocus(nextNode);
      // },
      // inputFormatters: [isPhoneNumber ? FilteringTextInputFormatter.digitsOnly : FilteringTextInputFormatter.singleLineFormatter],
      validator: (input){
        if(input!.isEmpty){
          if(isValidator){
            return validatorMessage ?? "";
          }
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon
      ),
    );
  }
}