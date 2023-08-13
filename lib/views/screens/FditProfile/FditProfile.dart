// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:provider/provider.dart';
import 'package:untitledtest11/provider/auth_provider.dart';
import 'package:untitledtest11/util/color_resources.dart';
import 'package:untitledtest11/views/baseWidget/spacer.dart';
import '../../../data/model/body/updateuser_model.dart';
import '../../../data/model/response/user_model.dart';
import '../../../localization/language_constrants.dart';
import '../../baseWidget/show_custom_snakbar.dart';
import '../../baseWidget/textfield/custom_textfield.dart';
import '../setting/setting.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});
  @override
  State<EditProfile> createState() => _EditProfileState();
}
class _EditProfileState extends State<EditProfile> {
  // bool _isObscure = true;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var emailController = TextEditingController();
  var usernameController = TextEditingController();

  EditUser editUser = EditUser();

  @override
  void initState() {
    super.initState();
    init(Provider.of<AuthProvider>(context,listen: false).user!);
  }


  init(UserDataModel user){
    emailController.text = user.personalData!.email.toString();
    usernameController.text = user.personalData!.userName.toString();
    firstnameController.text = user.personalData!.firstName.toString();
    lastnameController.text = user.personalData!.lastName.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
        builder: (context,auth,child){
          return  Scaffold(
              key: scaffoldKey,
              // backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: ColorResources.mainColor,
                leading: Padding(
                  padding: const EdgeInsets.only(top:10, left: 5),
                  child: IconButton(onPressed: (){
                    Navigator.pop(context);
                  },
                    icon: Icon(Icons.arrow_back,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
                leadingWidth: 20,
                title: Padding(
                  padding: const EdgeInsets.only(top: 8,left: 10),
                  child:
                  Center(
                    child: Text(
                      getTranslated("editprofile",context)!,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0 , horizontal: 15),
                      child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: AdvancedAvatar(
                                    size: 160,
                                    child: auth.user!.personalData!.photo == null
                                        ? Icon(Icons.person,color: Colors.white,size: 50,)
                                        : Image(image: NetworkImage(auth.user!.personalData!.photo!) ,
                                    ),
                                  ),

                                ),
                              ),
                              HSpacer(20),
                              CustomTextField(
                                controller: emailController,
                                textInputType: TextInputType.text,
                                labelText: getTranslated("email", context),
                                validatorMessage: "email must not be empty",
                              ),
                              HSpacer(20),

                              CustomTextField(
                                controller: usernameController,
                                textInputType: TextInputType.text,
                                labelText: getTranslated("username", context),
                                validatorMessage: "username must not be empty",
                              ),
                              HSpacer(20),

                              CustomTextField(
                                controller: firstnameController,
                                textInputType: TextInputType.text,
                                labelText: getTranslated("firstname", context),
                                validatorMessage: "firstname must not be empty",
                              ),
                              HSpacer(20),

                              CustomTextField(
                                controller: lastnameController,
                                textInputType: TextInputType.text,
                                labelText: getTranslated("lastname", context),
                                validatorMessage: "lastname must not be empty",
                              ),

                              HSpacer(40),
                              Provider.of<AuthProvider>(context,listen: false).isLoading
                                  ? CircularProgressIndicator()
                                  : Container(
                                width: double.infinity,
                                color: ColorResources.mainColor,
                                child: MaterialButton(
                                  onPressed: updateUser,
                                  child: Text("done",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          )
                      )
                  )
              )

          );

        },
      );

  }

  updateUser() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      editUser.firstName = firstnameController.text.trim();
      editUser.lastName = lastnameController.text.trim();
      editUser.userName = usernameController.text.trim();
      // editUser.photo = ageController.text.trim();
      editUser.email = emailController.text.trim();
      editUser.applicationUserId = Provider.of<AuthProvider>(context,listen: false).userData!.userId!;


      await Provider.of<AuthProvider>(context,listen: false).editUserData(editUser, route);
    }
  }

  route(bool isRoute,String errorMessage) async {
    if (isRoute) {
      showCustomSnackBar(errorMessage,context,isError: false);
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => Setting()));
    }
    else {
      showCustomSnackBar(errorMessage,context);
    }
  }
}