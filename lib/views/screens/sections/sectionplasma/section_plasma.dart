import 'package:flutter/material.dart';
import 'package:untitledtest11/util/color_resources.dart';
import 'package:untitledtest11/views/baseWidget/spacer.dart';
import '../../../../localization/language_constrants.dart';
import '../../../../shared/components.dart';
import '../../../../util/images.dart';
import '../needy/donor_list_plasma.dart';
import '../needy/needy_list_plasma.dart';
import '../needy/needy_plasma_screen.dart';

class SectionPlasma extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
          icon: Icon(Icons.arrow_back,
            color: ColorResources.secondColor,
            size: 30,
          ),
        ),
        title: Center(
          child: Text(
            getTranslated("sectionplasma", context)!,
            style: TextStyle(
              fontSize: 20.0,
              color: ColorResources.secondColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        color: ColorResources.secondColor,
        child: (
            Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                HSpacer(20),
                CircleAvatar(
                  radius: 90.0,
                  backgroundColor: Colors.white,
                  backgroundImage: Images.plasmaImage ,
                ),
                HSpacer(60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultButton(
                      backgroundColor: Colors.white,
                      text : getTranslated("needy",context)!,
                      function: (){
                        Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => NeedyPlasmaScreen(),
                          ),
                        );
                      },
                      color: ColorResources.secondColor,

                    ),
                    WSpacer(10),
                    DefaultButton(
                        backgroundColor: Colors.white,
                        text : getTranslated("needylistplasma",context)!,
                        function: (){
                          Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => NeedyListBlasmaScreen(),
                            ),
                          );
                        },
                        color: ColorResources.secondColor,
                        FontStyle: 30
                    ),

                  ],
                ),
                HSpacer(15),
                HSpacer(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultButton(
                      width: 200,
                      height: 180,
                      backgroundColor: Colors.white,
                      text :getTranslated("donorlist", context)!,
                      function: (){
                        Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => DonorsListPlasma(),
                          ),
                        );
                      },
                        color: ColorResources.secondColor,
                        FontStyle: 32
                    ),

                  ],
                ),
              ],
            )
        ),
      ),
    );
  }
}
