// // ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors
// import 'package:flutter/material.dart';
//
// import '../../../util/textStyle.dart';
//
// class CustomPasswordTextField extends StatefulWidget {
//   final TextEditingController? controller;
//   final String? hintTxt;
//   final String? labelTxt;
//   final String? image;
//   final FocusNode? focusNode;
//   final FocusNode? nextNode;
//   final TextInputAction? textInputAction;
//   CustomPasswordTextField({this.controller, this.hintTxt,this.labelTxt,this.image, this.focusNode, this.nextNode, this.textInputAction});
//   @override
//   _CustomPasswordTextFieldState createState() => _CustomPasswordTextFieldState();
// }
// class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
//   bool _obscureText = true;
//
//   // Toggles the password show status
//   void _toggle() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Theme.of(context).highlightColor,
//         borderRadius: BorderRadius.circular(6),
//         boxShadow: [
//           BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 7, offset: Offset(0, 1)) // changes position of shadow
//         ],
//       ),
//       child: TextFormField(
//         cursorColor: Theme.of(context).primaryColor,
//         controller: widget.controller,
//         obscureText: _obscureText,
//         keyboardType: TextInputType.visiblePassword,
//         focusNode: widget.focusNode,
//         textInputAction: widget.textInputAction ?? TextInputAction.next,
//         onFieldSubmitted: (v) {
//           setState(() {
//             widget.textInputAction == TextInputAction.done
//                 ? FocusScope.of(context).consumeKeyboardToken()
//                 : FocusScope.of(context).requestFocus(widget.nextNode);
//           });
//         },
//         validator: (value) {
//             if (value!.isEmpty) {
//               return ("Password must not be empty");
//               }
//               return null;
//           },
//         decoration: InputDecoration(
//             suffixIcon: IconButton(icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility), onPressed: _toggle),
//             prefixIcon: Icon(
//               Icons.lock,
//             ),
//             hintText: widget.hintTxt ?? '',
//             labelText: widget.labelTxt,
//             contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
//             isDense: true,
//             filled: true,
//             fillColor: Theme.of(context).highlightColor,
//             focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)),
//             hintStyle: cairoRegular.copyWith(color: Theme.of(context).hintColor),
//             border: InputBorder.none),
//       ),
//     );
//   }
// }

// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:untitledtest11/util/color_resources.dart';

class CustomPasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  // final String? hintTxt;
  final String? labelTxt;
  final String? image;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  // final TextInputAction? textInputAction;
  CustomPasswordTextField({this.controller,
    // this.hintTxt,
    this.labelTxt,
    this.image,
    this.focusNode, this.nextNode,
    // this.textInputAction
  });
  @override
  _CustomPasswordTextFieldState createState() => _CustomPasswordTextFieldState();
}
class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        // color: Theme.of(context).highlightColor,
        borderRadius: BorderRadius.circular(6),
        // boxShadow: [
        //   BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 7, offset: Offset(0, 1)) // changes position of shadow
        // ],
      ),
      child: TextFormField(
        // cursorColor: mainColor,
        controller: widget.controller,
        obscureText: _obscureText,
        keyboardType: TextInputType.visiblePassword,
        focusNode: widget.focusNode,
        // textInputAction: widget.textInputAction ?? TextInputAction.next,
        onFieldSubmitted: (v) {
          // setState(() {
          //   widget.textInputAction == TextInputAction.done
          //       ? FocusScope.of(context).consumeKeyboardToken()
          //       : FocusScope.of(context).requestFocus(widget.nextNode);
          // });
        },
        validator: (value) {
          if (value!.isEmpty) {
            return ("Password must not be empty");
          }
          return null;
        },
        decoration: InputDecoration(
          suffixIcon: IconButton(icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility ,color: ColorResources.mainColor), onPressed: _toggle),
          prefixIcon: Icon(Icons.lock,color: ColorResources.mainColor),
          // hintText: widget.hintTxt ?? '',
          labelText: widget.labelTxt,
          // contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
          // isDense: true,
          // filled: true,
          // fillColor: Theme.of(context).highlightColor,
          border:OutlineInputBorder(),
          // focusedBorder: OutlineInputBorder(),
          // hintStyle: cairoRegular.copyWith(color: Theme.of(context).hintColor),
        ),
      ),
    );
  }
}