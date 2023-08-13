// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../shared/network/local/cache_helper.dart';
// import '../cubit/cubit.dart';
// import '../cubit/states.dart';
// import '../shared/constants.dart';
//
//
//
// class ShopRegisterScreen extends StatelessWidget {
//   var FnameController = TextEditingController();
//   var LnameController = TextEditingController();
//   var phoneController = TextEditingController();
//   var SSNController = TextEditingController();
//   var genderController = TextEditingController();
//   var ageController = TextEditingController();
//   var bloodTypeController = TextEditingController();
//   var locationController = TextEditingController();
//   var chronicDiseasesController = TextEditingController();
//   var startDateController = TextEditingController();
//   var endDateController = TextEditingController();
//   var sectionIdController = TextEditingController();
//   var applicationUserIdController = TextEditingController();
//
//   var formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => DonorCubit(),
//       child: BlocConsumer<DonorCubit , DonorStates>(
//         listener: (context,state) {
//           // if (state is ShopRegisterSuccessState)
//           // {
//           //   if(state.loginModel.status)
//           //   {
//           //     print(state.loginModel.message);
//           //     print(state.loginModel.data?.token);
//           //
//           //     CacheHelper.saveData(key: 'token', value: state.loginModel.data?.token).then(
//           //             (value) {
//           //           //token = state.loginModel.data?.token;
//           //           navigateAndFinish(context, ShopLayout());
//           //         });
//           //   }
//           //   else
//           //   {
//           //     print(state.loginModel.message);
//           //
//           //     showToast(
//           //       text: state.loginModel.message,
//           //       state: ToastStates.ERROR,
//           //     );
//           //
//           //   }
//           // }
//         },
//         builder: (context,state) {
//           return Scaffold(
//             appBar: AppBar(),
//             body: Center(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Form(
//                     key: formKey,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'REGISTER',
//                           style: Theme.of(context).textTheme.headline4?.copyWith(
//                             color: Colors.black,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 5.0,
//                         ),
//                         Text(
//                           'Login now to browse our hot offers',
//                           style: Theme.of(context).textTheme.bodyText1?.copyWith(
//                               color: Colors.grey
//                           ),
//                         ),
//                         SizedBox(
//                           height: 30.0,
//                         ),
//                         TextFormField(
//                           controller: FnameController,
//                           keyboardType: TextInputType.name,
//                           validator: (String? value) {
//                             if (value == null || value.isEmpty)
//                             {
//                               return "Please enter your name";
//                             }
//                             return null;
//                           },
//                           decoration: InputDecoration(
//                             labelText: "Name",
//                             border: OutlineInputBorder(),
//                             prefixIcon: Icon(
//                               Icons.person,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 15.0,
//                         ),
//                         TextFormField(
//                           controller: LnameController,
//                           keyboardType: TextInputType.emailAddress,
//                           validator: (String? value) {
//                             if (value == null || value.isEmpty)
//                             {
//                               return "Please enter your email address";
//                             }
//                             return null;
//                           },
//                           decoration: InputDecoration(
//                             labelText: "Email Address",
//                             border: OutlineInputBorder(),
//                             prefixIcon: Icon(
//                               Icons.email_outlined,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 15.0,
//                         ),
//                         // TextFormField(
//                         //   controller: phoneController,
//                         //   keyboardType: TextInputType.phone,
//                         //   validator: (String? value) {
//                         //     if (value == null || value.isEmpty)
//                         //     {
//                         //       return "Please enter your phone";
//                         //     }
//                         //     return null;
//                         //   },
//                         //   decoration: InputDecoration(
//                         //     labelText: "Phone",
//                         //     border: OutlineInputBorder(),
//                         //     prefixIcon: Icon(
//                         //       Icons.phone,
//                         //     ),
//                         //   ),
//                         // ),
//                         SizedBox(
//                           height: 15.0,
//                         ),
//                         // TextFormField(
//                         //   //obscureText : DonorCubit.get(context).isPassword,
//                         //   controller: passwordController,
//                         //   keyboardType: TextInputType.visiblePassword,
//                         //   onFieldSubmitted: (value)
//                         //   {
//                         //
//                         //   },
//                         //   validator: (String? value) {
//                         //     if (value == null || value.isEmpty)
//                         //     {
//                         //       return "Please enter your Password";
//                         //     }
//                         //     return null;
//                         //   },
//                         //   decoration: InputDecoration(
//                         //       labelText: "Password",
//                         //       border: OutlineInputBorder(),
//                         //       prefixIcon: Icon(
//                         //         Icons.lock_outlined,
//                         //       ),
//                         //       suffixIcon: IconButton(
//                         //         onPressed: ()
//                         //         {
//                         //           //ShopRegisterCubit.get(context).changePasswordVisibility();
//                         //         }, icon: (Icon(Icons.holiday_village)),
//                         //         // icon: Icon(
//                         //         //   // ShopRegisterCubit.get(context).suffix,
//                         //         // ),
//                         //       )
//                         //   ),
//                         // ),
//                         SizedBox(
//                           height: 30.0,
//                         ),
//                         //state is! ShopRegisterLoadingState ?
//                         Container(
//                           width: double.infinity,
//                           height: 50.0,
//                           child: MaterialButton(
//                               child: Text(
//                                 'Register',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               color: Colors.red,
//                               onPressed: () {
//                                 if (formKey.currentState!.validate()) {
//                                   DonorCubit.get(context).postDonor(
//                                       firstName: FnameController.text,
//                                       lastName: LnameController.text,
//                                       ssn: '12345678901234',
//                                       age:0,
//                                       //age: ageController.text,
//                                       bloodType: "A+",
//                                       gender: "Female",
//                                       phone: "01023456789",
//                                       location: "Fayoum",
//                                       chronicDiseases: "Not Found",
//                                       startDate: "2023-03-29T13:12:38.200Z",
//                                       endDate: "2023-03-29T13:12:38.200Z",
//                                       sectionId: sectionId,
//                                       applicationUserId: appUserId);
//                                 }
//                               }
//                               // {
//                               //   if(formKey.currentState!.validate())
//                               //   {
//                               //     ShopRegisterCubit.get(context).userRegister
//                               //       (
//                               //       name: nameController.text,
//                               //         email: emailController.text,
//                               //         password: passwordController.text,
//                               //       phone: phoneController.text,
//                               //     );
//                               //   }
//                               // }
//                               ),
//                         )
//                         //Center(child: CircularProgressIndicator()),
//
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:untitledtest11/views/baseWidget/spacer.dart';
import 'package:untitledtest11/views/screens/auth/auth_screen.dart';
import '../../../data/model/body/forget_model.dart';
import '../../../localization/language_constrants.dart';
import '../../../provider/auth_provider.dart';
import '../../../util/color_resources.dart';
import '../../baseWidget/textfield/custom_textfield.dart';


class ForgetPasswordScreen extends StatefulWidget {
  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreen();
}
class _ForgetPasswordScreen extends State<ForgetPasswordScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKeyP = GlobalKey<FormState>();
  var emailController = TextEditingController();

  ForgetPassModel forgetModel = ForgetPassModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: ColorResources.mainColor,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.arrow_left,
            color: Colors.white,),
          onPressed: ()
          {
            Navigator.pop(
                context, MaterialPageRoute(builder:(context) => AuthScreen()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0 , horizontal: 30),
        child: Center(
          child: Form(
            key: formKeyP,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getTranslated("login", context)!,
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: ColorResources.mainColor,
                        ),
                      ),
                      HSpacer(10),
                      Text(
                        getTranslated("forgetpassword", context)!,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: ColorResources.mainColor,
                        ),
                      ),
                      HSpacer(10),
                      Text(
                        getTranslated("please", context)!,
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
                        getTranslated("send", context)!,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: forget,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
  forget() async {
    if (formKeyP.currentState!.validate()) {
      formKeyP.currentState!.save();
      forgetModel.email = emailController.text.trim();

      await Provider.of<AuthProvider>(context ,listen: false).forgetPassword(forgetModel,
          route);
    }
  }

  route(String errorMessage) async {
    Fluttertoast.showToast(
        msg: errorMessage,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 6,
        backgroundColor: ColorResources.mainColor,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}
