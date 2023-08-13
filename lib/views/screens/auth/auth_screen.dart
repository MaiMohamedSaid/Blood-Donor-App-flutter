// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitledtest11/localization/language_constrants.dart';
import 'package:untitledtest11/util/color_resources.dart';
import 'package:untitledtest11/views/screens/auth/register_screen.dart';
import '../../../provider/localization_provider.dart';
import '../../../util/app_constants.dart';
import '../../../util/images.dart';
import '../../baseWidget/spacer.dart';
import 'login_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}
class _AuthScreenState extends State<AuthScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKeyS = GlobalKey<FormState>();
  var formKeyL = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: Images.logoImage,
                width: 300.0,
                height: 300.0,
              ),
              Column(
                children: [
                  Text(
                    getTranslated("welcome", context)!,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: ColorResources.mainColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  HSpacer(10),
                  Text(getTranslated("welcomesentence", context)!,
                    style: TextStyle(
                      color: ColorResources.mainColor,
                    ),
                  ),
                ],
              ),
              HSpacer(40),

              Container(
                width: double.infinity,
                color: ColorResources.mainColor,
                child: MaterialButton(
                  onPressed: () {
                    scaffoldKey.currentState?.showBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60.0),
                        ),
                            (context) => Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            child: RegisterScreen(),
                          ),
                        ));
                  },
                  child: Text(getTranslated("signUp", context)!,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              HSpacer(20),

              Container(
                width: double.infinity,
                color: ColorResources.mainColor,
                child: MaterialButton(
                  onPressed: () {
                    scaffoldKey.currentState?.showBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                          (context) => Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: LoginScreen(),
                      ),
                    );
                  },
                  child: Text(
                    getTranslated("login", context)!,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              HSpacer(40),


              Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    onTap: () {
                      if(Provider.of<LocalizationProvider>(context,
                          listen: false).languageIndex == 0){
                        Provider.of<LocalizationProvider>(context,
                            listen: false).setLanguage(Locale(
                          AppConstants.languages![1].languageCode,
                          AppConstants.languages![1].countryCode,
                        ));
                      }
                      else{
                        Provider.of<LocalizationProvider>(context,
                            listen: false).setLanguage(Locale(
                          AppConstants.languages![0].languageCode,
                          AppConstants.languages![0].countryCode,
                        ));
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            Provider.of<LocalizationProvider>(context,
                                listen: false).locale!.languageCode,
                            style:
                            TextStyle(fontSize: 40, color: ColorResources.mainColor),
                          ),
                        ),
                        Icon(
                          Icons.language,
                          size: 20,
                          color: ColorResources.mainColor,
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
