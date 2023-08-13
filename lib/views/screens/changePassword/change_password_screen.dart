
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitledtest11/data/model/body/donation_model.dart';
import 'package:untitledtest11/views/screens/auth/auth_screen.dart';
import '../../../data/model/body/change_password_model.dart';
import '../../../localization/language_constrants.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/donation_provider.dart';
import '../../../provider/section_provider.dart';
import '../../../util/color_resources.dart';
import '../../../util/images.dart';
import '../../baseWidget/show_custom_snakbar.dart';
import '../../baseWidget/spacer.dart';
import '../../baseWidget/textfield/custom_password_textfield.dart';
import '../../baseWidget/textfield/custom_textfield.dart';
import '../auth/login_screen.dart';
import '../home/home_screen.dart';
import '../map/current_location.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}
class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKeyC = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var currentPassController = TextEditingController();
  var newPassController = TextEditingController();
  var confirmNewPassController = TextEditingController();

  changePassModel changepassModel = changePassModel();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Form(
          key: formKeyC,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      getTranslated("change_pass", context)!,
                      style: TextStyle(
                        fontSize: 30.0,
                        color: ColorResources.mainColor,
                      ),
                    ),
                    const HSpacer( 5.0,),
                    Text(getTranslated("password_statement", context)!,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
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
              HSpacer(10),
              CustomPasswordTextField(
                controller: currentPassController,
                labelTxt: getTranslated("currentpassword", context),
              ),
              HSpacer(10.0,),
              CustomPasswordTextField(
                controller: newPassController,
                labelTxt: getTranslated("newpassword", context),
              ),

              HSpacer(10.0,),
              CustomPasswordTextField(
                controller: confirmNewPassController,
                labelTxt: getTranslated("confirmpassword", context),
              ),
              Provider.of<AuthProvider>(context,listen: false).isLoading
                  ? CircularProgressIndicator()
                  : Padding(
                padding: const EdgeInsets.only(top: 40.0,bottom: 40.0),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorResources.mainColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: MaterialButton(
                      child: Text(
                        getTranslated("change", context)!,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: changePassUser
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  changePassUser() async {
    if (formKeyC.currentState!.validate()) {
      formKeyC.currentState!.save();
      changepassModel.email = emailController.text.trim();
      changepassModel.newPassword = newPassController.text.trim();
      changepassModel.confirmPassword = confirmNewPassController.text.trim();
      changepassModel.currentPassword = currentPassController.text.trim();

      await Provider.of<AuthProvider>(context,listen: false).changePassword(changepassModel,
          route);
    }
  }

  route(bool isRoute,String errorMessage) async {
    if (isRoute) {
      Provider.of<AuthProvider>(context,listen: false);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => AuthScreen()),(route) => false);
    }
    else {
      showCustomSnackBar(errorMessage,context);
    }
  }
}
