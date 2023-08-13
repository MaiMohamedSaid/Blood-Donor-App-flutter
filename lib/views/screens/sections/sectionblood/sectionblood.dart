// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitledtest11/localization/language_constrants.dart';
import 'package:untitledtest11/provider/donation_provider.dart';
import 'package:untitledtest11/provider/needs_provider.dart';
import 'package:untitledtest11/util/color_resources.dart';
import 'package:untitledtest11/util/images.dart';
import '../../../../shared/components.dart';
import '../../../baseWidget/spacer.dart';
import '../../Donation/Donation.dart';
import '../donorlist/donor_list.dart';
import '../needy_list_blood/needy_blood_screen.dart';
import '../needy_list_blood/needy_list_bloodt.dart';


class SectionBloodScreen extends StatefulWidget {
  final String sectionId;
  SectionBloodScreen({required this.sectionId});
  @override
  State<SectionBloodScreen> createState() => _SectionBloodScreenState();
}
class _SectionBloodScreenState extends State<SectionBloodScreen> {

  @override
  void initState() {
    super.initState();
    Provider.of<NeedsProvider>(context,listen: false).getNeedyList(widget.sectionId);
    Provider.of<DonationProvider>(context,listen: false).getDonorsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
          icon: Icon(Icons.arrow_back,
            color: ColorResources.mainColor,
            size: 20,
          ),
        ),
        title: Center(
          child: Text(
            getTranslated("sectionblood", context)!,
            style: TextStyle(
              fontSize: 20.0,
              color: ColorResources.mainColor,
            ),
          ),
        ),
      ),
      body: Container(
          color: ColorResources.mainColor,
          child: (
          Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              HSpacer(50),
              CircleAvatar(
                radius: 70.0,
                backgroundColor: Colors.white,
                backgroundImage: Images.bloodImage ,
              ),
              HSpacer(60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultButton(
                    text : getTranslated("donation", context)!,
                    function: (){
                      Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => DonationScreen(),
                        ),
                      );

                    },
                  ),
                  WSpacer(10),

                  DefaultButton(
                    text : getTranslated("donorlist", context)!,
                    function: (){
                      Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => DonorsList(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              HSpacer(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultButton(
                    text :getTranslated("needy", context)!,
                    function: (){
                      Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => NeedyBloodScreen(),
                        ),
                      );
                    },
                  ),

                  WSpacer(10),
                  DefaultButton(
                    text : getTranslated("needylistblood", context)!,
                    function: ()
                    {
                      Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => NeedyListBloodScreen(),
                        ),
                      );
                    },
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
