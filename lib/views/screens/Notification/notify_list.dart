// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitledtest11/localization/language_constrants.dart';
import 'package:untitledtest11/util/color_resources.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../data/model/body/map_model.dart';
import '../../../data/model/response/map_response_model.dart';
import '../../../provider/donation_provider.dart';
import '../../baseWidget/spacer.dart';


class NotifyListScreen extends StatefulWidget {
  final double? latitude;
  final double? longitude;
  final String? bloodType;
  final int? sectionId;
  const NotifyListScreen({super.key,this.sectionId,this.bloodType,this.longitude,this.latitude});
  @override
  State<NotifyListScreen> createState() => _NotifyListScreenState();
}

class _NotifyListScreenState extends State<NotifyListScreen> {
  MapModel mapModel = MapModel();

  final ButtonStyle style =
  ElevatedButton.styleFrom(backgroundColor: ColorResources.mainColor);

  @override
  void initState() {
    super.initState();
    getNearUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,
            color:ColorResources.mainColor,
            size: 20,
          ),
        ),
        title: Center(
          child: Text(
            getTranslated("near", context)!,
            style: TextStyle(
              color: ColorResources.mainColor,
              fontWeight: FontWeight.w400,
              fontSize: 25.0,
            ),
          ),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: (){},
        //     icon:Icon(
        //       Icons.notifications_none_outlined,
        //       color: Colors.grey,
        //       size: 30.0,
        //
        //     ),
        //   )
        // ],
      ),
      body: Container(
        color: Colors.grey[200],
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child:  Consumer<DonationProvider>(builder: (context, value , child){
                return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: value.usermap == null 
                        ? Container(
                      width: 300,
                      margin: EdgeInsets.only(bottom: 20),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: ColorResources.mainColor,
                            blurRadius: 5
                          )
                        ]
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.lock_clock_outlined,
                          color: ColorResources.mainColor,
                          ),
                          HSpacer(5),
                          Text(
                           getTranslated("nearmessage", context)!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: ColorResources.mainColor
                            ),
                          ),
                        ],
                      ),
                    )
                        : defaultPost(context,
                        value.usermap!
                    )
                );
              },
              ),
            ),
          )
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ColorResources.mainColor,
        onPressed: getNearUser,
        icon: const Icon(Icons.add),
        label: Text(getTranslated("button", context)!),
      ),
    );
  }

  Widget defaultPost (BuildContext context,MapUserModel model) => Column(
    children: [
      Container(
          width: 300,
          height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
            ),
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorResources.mainColor,
                    ),
                    child: Icon(Icons.person,
                    color: Colors.white,
                    ),
                  ),
                  HSpacer(20),
                  Row(
                    children: [
                      Text(getTranslated("name", context)!),
                      WSpacer(5),
                      Text(
                       " : "  + model.First_name! + ' '+model.Last_name!,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  HSpacer(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on,
                        color: ColorResources.mainColor,
                      ),
                      WSpacer(5),
                      Text(
                          model.Country! + " "+ model.Governorate!
                      ),
                    ],
                  ),
                  HSpacer(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        getTranslated("bloodtype", context)!,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      WSpacer(10),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: ColorResources.mainColor,
                          ),
                          Text(
                            model.Blood_type!,
                            style: TextStyle(
                              color: Colors.grey[200],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  HSpacer(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(getTranslated("distance", context)!),
                      WSpacer(5),
                      Text(
                          " : " + model.Distance!.toString(),
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  HSpacer(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: style,
                        onPressed: () async {
                          final Uri url = Uri(
                            scheme: 'tel',
                            path: model.Phone!,
                          );
                          if(await canLaunchUrl(url)){
                            await launchUrl(url);
                          }else{
                            print("conot launch Url");
                          }
                        },
                        child:Icon(
                          Icons.phone,
                          size: 35.0,
                          color: Colors.white,
                        ),
                      ),
                      WSpacer(10),
                      Text(
                        model.Phone!,
                      ),


                    ],
                  ),
                ]
            ),
          )
      ),
      HSpacer(35),
      Container(
        width: 300,
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: ColorResources.mainColor,
                  blurRadius: 5
              )
            ]
        ),
        child: Column(
          children: [
            Icon(Icons.lock_clock_outlined,
              color: ColorResources.mainColor,
            ),
            HSpacer(5),
            Text(
              getTranslated("nearsmessage", context)!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: ColorResources.mainColor
              ),
            ),
          ],
        ),
      ),
      HSpacer(10),
      Icon(Icons.arrow_circle_down_outlined,
      size: 50,
      )

    ],
  );

  getNearUser() async {
    await Provider.of<DonationProvider>(context,listen: false).incrementCounter();
    mapModel.l1 = widget.longitude;
    mapModel.l2 =  widget.latitude;
    mapModel.curr = Provider.of<DonationProvider>(context,listen: false).countVal;
    mapModel.BT = widget.bloodType;
    mapModel.DT =  widget.sectionId;

    await Provider.of<DonationProvider>(context,listen: false).LatLon(mapModel);
  }

}
