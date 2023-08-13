// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitledtest11/localization/language_constrants.dart';
import 'package:untitledtest11/util/color_resources.dart';
import '../../../data/model/body/login_model.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/section_provider.dart';
import '../../baseWidget/spacer.dart';
import '../../baseWidget/textfield/custom_password_textfield.dart';
import '../../baseWidget/textfield/custom_textfield.dart';
import '../../baseWidget/show_custom_snakbar.dart';
import '../changePassword/forget_password.dart';
import '../dashboard/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  final String? email;
  final String? pass;
  LoginScreen({this.email, this.pass});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKeyS = GlobalKey<FormState>();
  var formKeyL = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool isPassword = true;
  LoginModel loginModel = LoginModel();

  @override
  void initState() {
    super.initState();
    emailController.text = widget.email ?? "";
    passController.text = widget.pass ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKeyL,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(
                  getTranslated("login", context)!,
                  style:  TextStyle(
                    color: ColorResources.mainColor,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                HSpacer(8),
                Text(
                  getTranslated("loginSentence", context)!,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            HSpacer(35),
            CustomTextField(
              controller: emailController,
              textInputType: TextInputType.emailAddress,
              labelText: getTranslated("email", context)!,
              validatorMessage: "Email must not be empty",
              prefixIcon: Icon(
                Icons.email,
                color: ColorResources.mainColor,
              ),
            ),

            HSpacer(15),
            CustomPasswordTextField(
              controller: passController,
              labelTxt: getTranslated("password", context),
            ),
            TextButton(
                onPressed: ()
                {
                  Navigator.push(
                      context, MaterialPageRoute(builder:(context) => ForgetPasswordScreen()));
                },
                child: Text(
                  getTranslated("forgetpassword", context)!,
                  style: TextStyle(
                    color: ColorResources.mainColor,

                  ),
                )
            ),

            HSpacer(30),

            Provider.of<AuthProvider>(context,listen: false).isLoading
                 ? CircularProgressIndicator()
                 : Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: MaterialButton(
                color: ColorResources.mainColor,
                onPressed:login ,
                child: Text(
                  getTranslated("login", context)!,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            HSpacer(40),
          ],
        ),
      ),
    );
  }

  login() async {
    if (formKeyL.currentState!.validate()) {
      formKeyL.currentState!.save();
      loginModel.email = emailController.text.trim();
      loginModel.password = passController.text.trim();
      await Provider.of<AuthProvider>(context ,listen: false).login(loginModel,
          route);
    }
  }
  route(bool isRoute,String errorMessage) async {
    if (isRoute) {
      Provider.of<SectionProvider>(context,listen: false).getSections(
          Provider.of<AuthProvider>(context,listen: false).userData!.token!
      );
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => DashBoardScreen()),(route) => false);
    }
    else {
      showCustomSnackBar(errorMessage,context);
    }
  }
}
