// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:untitledtest11/localization/language_constrants.dart';
import 'package:untitledtest11/util/color_resources.dart';
import 'package:untitledtest11/views/baseWidget/spacer.dart';
import '../../../../data/model/response/doonors_list_model.dart';
import '../../../../provider/donation_provider.dart';
import '../../chat/chat_details.dart';
import '../../chat/chat_details_test.dart';

class DonorsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 1.0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
          icon: Icon(Icons.arrow_back,
            color: Colors.black,
            size: 20,
          ),
        ),
        title: Text(
          getTranslated("donorlist", context)!,
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w400
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.grey[200],
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                HSpacer(20),
                Provider.of<DonationProvider>(context,listen: false).donorsList != null
                    ? ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context , index) => DefaultPost(context,
                        Provider.of<DonationProvider>(context,listen: false).donorsList![index]
                    ),
                    separatorBuilder: (context, index) => HSpacer(10),
                    itemCount: Provider.of<DonationProvider>(context,listen: false).donorsList!.length)
                    : Center(child: CircularProgressIndicator()),

              ],
            ),
          ),
        ),
      ),

    );
  }

  Widget DefaultPost (BuildContext context, DonorssModel model) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      color: Colors.white,
    ),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.firstName! + ' ' +model.lastName!,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
            ),
          ),
         HSpacer(10),
          Row(
            children: [
              Text(
                model.location!,
              ),
              WSpacer(5)
            ],
          ),
          HSpacer(10),

          Column(
            children: [
              Text(
                model.startDate! + "   " + "to" ,
              ),
              Text( model.endDate!)
            ],
          ),
          HSpacer(10),

          Row(
            children: [
              Text(
               getTranslated("bloodtype", context)!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16
                ),
              ),
              WSpacer(15),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CircleAvatar(
                    backgroundColor: ColorResources.mainColor,
                  ),
                  Text(
                    model.bloodType!,
                    style: TextStyle(
                      color: Colors.grey[200],
                    ),
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                  onPressed: ()=>
                    Navigator.push(
                        context, MaterialPageRoute(builder:(context) => ChatDetailsTestScreen(id: model.applicationUserId!))),
                  icon: Icon(
                    Icons.chat,
                    size: 35.0,
                    color: Colors.grey[400],
                  ))
            ],
          ),
        ],
      ),
    ),
  );
}