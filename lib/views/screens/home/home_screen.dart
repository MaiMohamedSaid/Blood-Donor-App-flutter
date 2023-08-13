// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitledtest11/localization/language_constrants.dart';
import 'package:untitledtest11/util/color_resources.dart';
import 'package:untitledtest11/util/images.dart';
import 'package:untitledtest11/views/baseWidget/spacer.dart';
import '../../../data/model/response/section_model.dart';
import '../../../provider/section_provider.dart';
import '../Notification/notify_list.dart';
import '../chat/chat.dart';
import '../sections/sectionblood/sectionblood.dart';
import '../sections/sectionplasma/section_plasma.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: ColorResources.mainColor,
        leading: IconButton(
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChatScreen()));
          },
          icon: Icon(
            Icons.chat_bubble,
            color: Colors.white,
            size: 30.0,
          ),
        ),
        title: Center(
          child: Text(
            getTranslated("home", context)!,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => NotifyListScreen()));
            },
            icon:Icon(
              Icons.notifications_none_outlined,
              color: Colors.white,
              size: 30.0,

            ),
          )
        ],
      ),

      body: Consumer<SectionProvider>(
        builder: (context,section,child){
          return Container(
            color: Colors.grey[200],
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context , index) => DefaultChoose(context ,
                        section.sectionsList![index],index,

                      ),

                      itemCount: section.sectionsList!.length,
                      separatorBuilder: (BuildContext context, int index) => HSpacer(70)
                  ),
                )

            ),
          );
        },
      ),
    );
  }
}
//
Widget DefaultChoose (context ,SectionModel model, index) => Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    HSpacer(90),
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        // model.id == 1 ?
        color: ColorResources.mainColor
            // : ColorResources.secondColor,
      ),
      child: MaterialButton(
        minWidth:double.infinity,
        height: 170.0,
        onPressed: (){
          Provider.of<SectionProvider>(context,listen: false).saveSectionId(model.id!);

          Navigator.push(context,
            MaterialPageRoute(
                // model.id == 1 ?
              builder: (context) =>  SectionBloodScreen(sectionId: "1")
                    // : SectionPlasma(),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 70.0,
                backgroundColor: Colors.white,
                // model.id == 1 ?
                backgroundImage:Images.bloodImage
                    // : Images.plasmaImage ,
              ),
             HSpacer(10),
              Text(
                getTranslated("sectionblood", context)!,
                    // + ' '+ model.name!,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 25.0,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    HSpacer(40),
    Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          // model.id == 1 ?
          color: ColorResources.secondColor
        // : ,
      ),
      child: MaterialButton(
        minWidth:double.infinity,
        height: 170.0,
        onPressed: (){
          Provider.of<SectionProvider>(context,listen: false).saveSectionId(model.id!);

          Navigator.push(context,
            MaterialPageRoute(
              // model.id == 1 ?
                builder: (context) =>   SectionPlasma()
              // :,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              CircleAvatar(
                  radius: 70.0,
                  backgroundColor: Colors.white,
                  // model.id == 1 ?
                  backgroundImage:Images.plasmaImage
                // :  ,
              ),
              HSpacer(10),
              Text(
                getTranslated("sectionplasma", context)!,
                // + ' '+ model.name!,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 25.0,
                ),
              ),
            ],
          ),
        ),
      ),
    ),

  ],
);