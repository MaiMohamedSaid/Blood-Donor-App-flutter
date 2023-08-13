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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitledtest11/data/model/body/donation_model.dart';
import '../../../localization/language_constrants.dart';
import '../../../provider/donation_provider.dart';
import '../../../provider/localization_provider.dart';
import '../../../provider/section_provider.dart';
import '../../../util/app_constants.dart';
import '../../../util/color_resources.dart';
import '../../../util/images.dart';
import '../../baseWidget/show_custom_snakbar.dart';
import '../../baseWidget/spacer.dart';
import '../../baseWidget/textfield/custom_textfield.dart';
import '../home/home_screen.dart';
import '../map/current_location.dart';

enum Language { English, Arabic}

class LanguageScreen extends StatefulWidget {
  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}
class _LanguageScreenState extends State<LanguageScreen> {

  Language? _languageItem = Language.English;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(getTranslated("language", context)!,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ColorResources.mainColor,
                  ),
                ),
              ),
              HSpacer(15),
              Column(
                children: [
                  // GestureDetector(
                  //   onTap: () {
                  //     if(Provider.of<LocalizationProvider>(context,
                  //         listen: false).languageIndex == 0){
                  //       Provider.of<LocalizationProvider>(context,
                  //           listen: false).setLanguage(Locale(
                  //         AppConstants.languages![1].languageCode,
                  //         AppConstants.languages![1].countryCode,
                  //       ));
                  //     }
                  //     else{
                  //       Provider.of<LocalizationProvider>(context,
                  //           listen: false).setLanguage(Locale(
                  //         AppConstants.languages![0].languageCode,
                  //         AppConstants.languages![0].countryCode,
                  //       ));
                  //     }
                  //   },
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       Container(
                  //         padding: EdgeInsets.all(15),
                  //         child: Text(
                  //           Provider.of<LocalizationProvider>(context,
                  //               listen: false).locale!.languageCode,
                  //           style:
                  //           TextStyle(fontSize: 40, color: ColorResources.mainColor),
                  //         ),
                  //       ),
                  //       Icon(
                  //         Icons.language,
                  //         size: 20,
                  //         color: ColorResources.mainColor,
                  //       )
                  //     ],
                  //   ),
                  // ),
                  Container(
                    width: 160,
                    child: RadioListTile(
                      title: Text("English"),
                      value: Language.English,
                      activeColor: ColorResources.mainColor,
                      groupValue: _languageItem,
                      onChanged: (value){
                        setState(() {
                          if(Provider.of<LocalizationProvider>(context, listen: false).languageIndex == 1){
                            Provider.of<LocalizationProvider>(context, listen: false).setLanguage(Locale(
                              AppConstants.languages![0].languageCode,
                              AppConstants.languages![0].countryCode,
                            ));
                           _languageItem = value;

                          }
                        });
                      },
                    ),
                  ),
                  Container(
                    width: 160,
                    child: RadioListTile(
                      title: Text("Arabic"),
                      value: Language.Arabic,
                      groupValue: _languageItem,
                      activeColor: ColorResources.mainColor,
                      onChanged: (value){
                        setState(() {
                       if(Provider.of<LocalizationProvider>(context, listen: false).languageIndex == 0) {
                          Provider.of<LocalizationProvider>(
                             context, listen: false).setLanguage(Locale(
                           AppConstants.languages![1].languageCode,
                           AppConstants.languages![1].countryCode,
                         ));
                         _languageItem = value;
                       }
                        });
                      },
                    ),
                  ),

                ],
              ),

            ],
          ),
        ),
      )
    );
  }

}
