// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitledtest11/localization/language_constrants.dart';
import 'package:untitledtest11/util/color_resources.dart';
import '../../../../data/model/response/needy_list_model.dart';
import '../../../../provider/needs_provider.dart';
import '../../../baseWidget/spacer.dart';
import '../../chat/chat_details_test.dart';


class NeedyListBloodScreen extends StatelessWidget {
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
        title: Center(
        child: Text(
            getTranslated("needylistblood", context)!,
                  style: TextStyle(
                      color: ColorResources.mainColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 25.0,
                      ),
                   ),
                ),
        backgroundColor: Colors.white,

      ),
      body: Container(
        color: Colors.grey[200],
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
            Provider.of<NeedsProvider>(context,listen: false).needyList != null
                ? ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context , index) => DefaultPost(context,
                    Provider.of<NeedsProvider>(context,listen: false).needyList![index]
                ),
                separatorBuilder: (context, index) => HSpacer(10),
                itemCount: Provider.of<NeedsProvider>(context,listen: false).needyList!.length)
                : Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );

  }

  Widget DefaultPost (BuildContext context,NeedsModel model) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      color: Colors.white,
    ),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row (
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                model.firstName! + ' '+model.lastName!,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              HSpacer(5),
              Row(
                children: [
                  Icon(Icons.location_on),
                  Text(
                    model.location!,
                  ),
                ],
              ),
              HSpacer(5),

              Text(
                model.date!,
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
         WSpacer(60),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
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
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              HSpacer(5),

              Row(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color:  ColorResources.mainColor,
                        ),
                      ),
                      Text(
                        model.quantity!.toString(),
                        style: TextStyle(
                          color: Colors.grey[200],
                        ),
                      ),
                    ],
                  ),
                  HSpacer(5),

                  Text(
                   getTranslated("units", context)!,
                    style: TextStyle(
                      color:  ColorResources.mainColor,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
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
