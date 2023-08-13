// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitledtest11/data/model/body/register_model.dart';
import 'package:untitledtest11/util/color_resources.dart';
import '../../../localization/language_constrants.dart';
import '../../../provider/auth_provider.dart';
import '../../baseWidget/show_custom_snakbar.dart';
import '../../baseWidget/spacer.dart';
import '../../baseWidget/textfield/custom_password_textfield.dart';
import '../../baseWidget/textfield/custom_textfield.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKeyS = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  RegisterModel registerModel = RegisterModel();
  bool eye = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKeyS,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getTranslated("signUp", context)!,
                style: TextStyle(
                  color: ColorResources.mainColor,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              HSpacer(8),

              Text(
                getTranslated("welcomesentence", context)!,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          HSpacer(35),
          HSpacer(15),
          CustomTextField(
            controller: firstController,
            textInputType: TextInputType.text,
            labelText: getTranslated("firstname", context),
            validatorMessage: "First Name must not be empty",
            prefixIcon: Icon(
              Icons.person,
              color: ColorResources.mainColor,

            ),
          ),
         HSpacer(15),
          CustomTextField(
            controller: lastController,
            textInputType: TextInputType.text,
            labelText: getTranslated("lastname", context),
            validatorMessage: "Last Name must not be empty",
            prefixIcon: Icon(
              Icons.person,
              color: ColorResources.mainColor,

            ),
          ),
          HSpacer(15),
          CustomTextField(
            controller: nameController,
            textInputType: TextInputType.text,
            labelText: getTranslated("username", context),
            validatorMessage: "User Name must not be empty",
            prefixIcon: Icon(
              Icons.person,
              color: ColorResources.mainColor,
            ),
          ),
          HSpacer(15),
          CustomTextField(
            controller:emailController ,
            textInputType: TextInputType.emailAddress,
            labelText: getTranslated("email", context),
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

          HSpacer(15),
          HSpacer(25),

          Provider.of<AuthProvider>(context,listen: false).isLoading
              ? CircularProgressIndicator()
              : Container(
             width: double.infinity,
             decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: ColorResources.mainColor,
            ),
            child: MaterialButton(
              onPressed: addUser,
              child: Text(
                getTranslated("signUp", context)! ,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          HSpacer(25),
        ],
      ),
    );
  }
  addUser() async {
    if (formKeyS.currentState!.validate()) {
      formKeyS.currentState!.save();
      registerModel.firstName = firstController.text.trim();
      registerModel.lastName = lastController.text.trim();
      registerModel.username = nameController.text.trim();
      registerModel.email = emailController.text.trim();
      registerModel.password = passController.text.trim();

      await Provider.of<AuthProvider>(context,listen: false).registration(registerModel,
          route);
      }
    }
  route(bool isRoute,String email,String password,String errorMessage) async {
    if (isRoute) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => LoginScreen(email: email,pass: password,)),(route) => false);
    }
    else {
      showCustomSnackBar(errorMessage,context);
    }
  }
}
