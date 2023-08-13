// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitledtest11/util/color_resources.dart';
import 'package:untitledtest11/views/screens/dashboard/dashboard_screen.dart';
import '../../../localization/language_constrants.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/theme_provider.dart';
import '../../baseWidget/spacer.dart';
import '../FditProfile/FditProfile.dart';
import '../appLanguage/appLanguage.dart';
import '../auth/auth_screen.dart';
import '../changePassword/change_password_screen.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);
  @override
  State<Setting> createState() => _SettingState();
}
class _SettingState extends State<Setting> {
  bool valNotify1 = false;

  onChangeFunction1(bool newValue1){
    Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
    setState(() {
      valNotify1 = newValue1;
    });
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();
  void initstate (){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: ColorResources.mainColor,
          leading: Padding(
            padding: const EdgeInsets.only(top:10, left: 5),
            child: IconButton(onPressed: (){
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (_) => DashBoardScreen()),(route) => false);
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
                getTranslated("setting",context)!,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      // ClipRRect(
                      //   borderRadius: BorderRadius.circular(40),
                      //   child: auth.user!.personalData!.photo == null
                      //       ? Icon(Icons.person,color: Colors.white,size: 50,)
                      //       : Image(image: NetworkImage(auth.user!.personalData!.photo!) ,
                      //     height: 65,
                      //     width: 65,
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //   auth.user!.personalData!.userName.toString(),
                            //   style: TextStyle(
                            //     fontSize: 18,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            HSpacer(8),
                            Text(getTranslated("heystatement", context)!,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: ColorResources.mainColor,
                  thickness: 2,
                  indent: 20,
                  endIndent: 30,
                ),
                HSpacer(40),
                MaterialButton(
                  onPressed: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        isScrollControlled: true,
                        context: context,
                        builder: (_) =>
                            SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ChangePasswordScreen(),
                              ),
                            ));
                  },
                  child: ListTile(
                    leading: Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: Icon(Icons.key),
                    ),
                    title: Text(getTranslated("change_pass", context)!,
                      style: TextStyle(
                        fontSize: 17,

                      ),

                    ),
                    subtitle: Text(getTranslated("change_statement", context)!,
                      style: TextStyle(
                          fontSize: 15
                      ),
                    ),
                  ),
                ),
                HSpacer(10),
                MaterialButton(
                  onPressed: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        // backgroundColor: Colors.white,
                        context: context,
                        builder: (_) =>
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height: 200,
                                  child: LanguageScreen()),
                            ));
                  },
                  child: ListTile(
                    leading: Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: Icon(Icons.language),
                    ),
                    title: Text(getTranslated("language", context)!,
                      style: TextStyle(
                        fontSize: 17,

                      ),

                    ),
                    subtitle: Text(getTranslated("languages", context)!,
                      style: TextStyle(
                          fontSize: 15
                      ),
                    ),
                  ),
                ),
                HSpacer(10),
                MaterialButton(
                  onPressed: () async {
                    await Provider.of<AuthProvider>(context, listen: false)
                        .getUserData(
                        Provider.of<AuthProvider>(context, listen: false).userData!.userId!
                    );
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => EditProfile()));
                    // showModalBottomSheet(
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(20.0),
                    //     ),
                    //     backgroundColor: Colors.white,
                    //     context: context,
                    //     builder: (_) =>
                    //         SingleChildScrollView(
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(8.0),
                    //             child: Container(
                    //                 child: EditProfile()),
                    //           ),
                    //         ));
                  },
                  child: ListTile(
                    leading: Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: Icon(Icons.person),
                    ),
                    title: Text(getTranslated("editprofile", context)!,
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    subtitle: Text(getTranslated("editstatement", context)!,
                      style: TextStyle(
                          fontSize: 15
                      ),
                    ),
                  ),
                ),
                HSpacer(10),
                Column(
                  children: [
                    WSpacer(10),
                    buildNotificationOption(getTranslated("theme", context)!, valNotify1, onChangeFunction1),
                    HSpacer(60),
                    Center(
                      child: Container(
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: ColorResources.mainColor,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Provider.of<AuthProvider>(
                                context, listen: false).clearUser().then((
                                value) {
                              value
                                  ? Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(
                                      builder: (_) => AuthScreen()), (
                                      route) => false)
                                  : null;
                            });
                          },
                          child: Text(
                            getTranslated("signout", context)!,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )

                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Text("App",
                        style: TextStyle(
                            fontSize: 15
                        ),
                      ),
                      Text("Hayah",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            )

        )
    );
  }
  Padding buildNotificationOption(String title, bool value, Function onChangedMethod){
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: ColorResources.mainColor,
          ),
          ),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: value,
              activeColor: ColorResources.mainColor,
              trackColor: Colors.grey,
              onChanged: (bool newValue){
                onChangedMethod(newValue);
              },
            ),
          )
        ],
      ),
    );
  }

  GestureDetector buildAccountOption(BuildContext context, String title){
    return GestureDetector(
      onTap: (){
        showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(
            title: Text(title,
              style: TextStyle(
                  fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("option 1"),
                Text("option 2"),
              ],
            ),
            actions: [
              TextButton(onPressed: (){
                Navigator.of(context).pop();
              },
                  child: Text("Close"))
            ],
          );
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style: TextStyle(fontWeight: FontWeight.w500),),
            Icon(Icons.arrow_forward_ios, color: ColorResources.mainColor,)
          ],
        ),
      ),
    );
  }
  GestureDetector buildEditingOption(BuildContext context){
    return GestureDetector(
      onTap: (){
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => AuthScreen()),(route) => false);
        // showDialog(context: context, builder: (BuildContext context ){
        //   return
        //     AlertDialog(
        //     // title: Text(title,
        //     //   style: TextStyle(
        //     //       fontSize: 20,
        //     //       fontWeight: FontWeight.bold
        //     //   ),),
        //     content: EditProfile(),
        //     actions: [
        //       TextButton(onPressed: (){
        //         Navigator.of(context).pop();
        //       },
        //           child: Text("Close"))
        //     ],
        //   );
        // });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text(title,style: TextStyle(fontWeight: FontWeight.w500),),
            Icon(Icons.arrow_forward_ios, color: ColorResources.mainColor,)
          ],
        ),
      ),
    );
  }
  GestureDetector buildChangeOption(BuildContext context){
    return GestureDetector(
      onTap: (){
        showDialog(context: context, builder: (BuildContext context ){
          return
            AlertDialog(
              content: ChangePasswordScreen(),
              actions: [
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                },
                    child: Text("Close",
                      style: TextStyle(
                        color: ColorResources.mainColor
                      ),
                    ))
              ],
            );
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text(title,style: TextStyle(fontWeight: FontWeight.w500),),
            Icon(Icons.arrow_forward_ios, color: ColorResources.mainColor,)
          ],
        ),
      ),
    );
  }



}