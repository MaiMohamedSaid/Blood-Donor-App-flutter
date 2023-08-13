
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitledtest11/data/model/body/donation_model.dart';
import 'package:untitledtest11/provider/auth_provider.dart';
import '../../../localization/language_constrants.dart';
import '../../../provider/donation_provider.dart';
import '../../../provider/section_provider.dart';
import '../../../util/color_resources.dart';
import '../../../util/images.dart';
import '../../baseWidget/show_custom_snakbar.dart';
import '../../baseWidget/spacer.dart';
import '../../baseWidget/textfield/custom_textfield.dart';
import '../Notification/notify_list.dart';
import '../home/home_screen.dart';
import '../map/current_location.dart';
enum Gender { Male, Female}
enum ChronicDisease { Found, NotFound}
const List<String> list = <String>[ 'AP', 'A-','BP','B-','ABP','AB-','OP','O-'];
class DonationScreen extends StatefulWidget {
  @override
  State<DonationScreen> createState() => _DonationScreenState();
}
class _DonationScreenState extends State<DonationScreen> {
  var FnameController = TextEditingController();
  var LnameController = TextEditingController();
  var phoneController = TextEditingController();
  var SSNController = TextEditingController();
  var genderController = TextEditingController();
  var ageController = TextEditingController();
  var bloodTypeController = TextEditingController();
  var locationController = TextEditingController();
  var chronicDiseasesController = TextEditingController();
  var startDateController = TextEditingController();
  var endDateController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  DonationModel donationModel = DonationModel();
  Gender? _genderItem = Gender.Male;
  ChronicDisease? _chronicDisease = ChronicDisease.NotFound;
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
          icon: Icon(Icons.arrow_back),
          color: ColorResources.mainColor,
          iconSize: 30,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image(
                  image:  Images.logo1Image,
                  width: 300.0,
                  height: 200.0,
                ),
                Container(
                  width: double.infinity,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Form(
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                            getTranslated("donation",context)!,
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  color: ColorResources.mainColor,
                                ),
                              ),
                             HSpacer(15),
                              Container(
                                color: Color(0XFFF4F8FB),
                                child: CustomTextField(
                                  controller: SSNController,
                                  textInputType: TextInputType.number,
                                  labelText: getTranslated("ssn", context)!,
                                  validatorMessage: "ssn must not be empty",
                                ),
                              ),
                              HSpacer(15),
                              Container(
                                color: Color(0XFFF4F8FB),
                                child: CustomTextField(
                                  controller: FnameController,
                                  textInputType: TextInputType.text,
                                  labelText: getTranslated("firstname", context)!,
                                  validatorMessage: "firstname must not be empty",
                                ),
                              ),
                              HSpacer(15),
                              Container(
                                color: Color(0XFFF4F8FB),
                                child: CustomTextField(
                                  controller: LnameController,
                                  textInputType: TextInputType.text,
                                  labelText: getTranslated("lastname", context)!,
                                  validatorMessage: "lastname must not be empty",
                                ),
                              ),
                              HSpacer(15),
                              Row(
                                children: [
                                  Container(
                                    width: 160,
                                    color: Color(0XFFF4F8FB),
                                    child: CustomTextField(
                                      controller: ageController,
                                      textInputType: TextInputType.number,
                                      labelText: getTranslated("age", context),
                                      validatorMessage: "Age must not be empty",
                                    ),
                                  ),
                                  WSpacer(30),
                                  Text(getTranslated("bloodtype", context)!,
                                  style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                                  ),
                                  WSpacer(15),
                                  DropdownButton <String> (
                                    value: dropdownValue,
                                    icon: Icon(Icons.arrow_downward),
                                    elevation: 20,
                                    // style: const TextStyle(color: Colors.black),
                                    underline: Container(
                                      height: 2,
                                      color: ColorResources.mainColor,
                                    ),
                                    onChanged: (String? value){
                                      setState(() {
                                        dropdownValue=value!;
                                      });
                                    },
                                    items: list.map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value));
                                    } ).toList(),
                                  ),
                                ],
                              ),
                              HSpacer(15),
                              Row(
                                children: [
                                  Text(getTranslated("gender", context)!,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Container(
                                    width: 140,
                                    child: RadioListTile(
                                      title: Text(getTranslated("male", context)!),
                                      value: Gender.Male,
                                      activeColor: ColorResources.mainColor,
                                      groupValue: _genderItem,
                                      onChanged: (value){
                                        setState(() {
                                          _genderItem = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    child: RadioListTile(
                                      activeColor: ColorResources.mainColor,
                                      title: Text(getTranslated("female", context)!),
                                      value: Gender.Female,
                                      groupValue: _genderItem,
                                      onChanged: (value){
                                        setState(() {
                                          _genderItem = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                color: Color(0XFFF4F8FB),
                                child: CustomTextField(
                                  controller: startDateController,
                                  textInputType: TextInputType.text,
                                  labelText: getTranslated("startdate", context),
                                  validatorMessage: "Start Date must not be empty",
                                ),
                              ),
                              HSpacer(15),
                              Container(
                                color: Color(0XFFF4F8FB),
                                child: CustomTextField(
                                  controller: endDateController,
                                  textInputType: TextInputType.text,
                                  labelText: getTranslated("enddate", context),
                                  validatorMessage: "End Date must not be empty",
                                ),
                              ),
                              HSpacer(15),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12.0 , horizontal: 15),
                                child: Row(
                                  children: [
                                    Text(getTranslated("yourcurrentlocation", context)!,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                    ),
                                    ),
                                    WSpacer(18),
                                    Container(
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: ColorResources.mainColor,
                                      ),
                                      child: MaterialButton(
                                        onPressed:() {
                                          Navigator.push(context,
                                                MaterialPageRoute(builder: (_) => CurrentLocationScreen()));
                                          },
                                        child: Text(
                                          getTranslated("currentlocation", context)!,
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: Color(0XFFF4F8FB),
                                child: CustomTextField(
                                  controller: locationController,
                                  textInputType: TextInputType.text,
                                  labelText: getTranslated("location", context),
                                  validatorMessage: "Location must not be empty",
                                ),
                              ),
                              HSpacer(15),
                              Container(
                                color: Color(0XFFF4F8FB),
                                child: CustomTextField(
                                  controller: phoneController,
                                  textInputType: TextInputType.number,
                                  labelText: getTranslated("phone", context)!,
                                  validatorMessage: "Phone must not be empty",
                                ),
                              ),
                              HSpacer(15),
                              Row(
                                children: [
                                  Text(getTranslated("chronicdisease", context)!,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Container(
                                    width: 120,
                                    child: RadioListTile(
                                      activeColor: ColorResources.mainColor,
                                      title: Text(getTranslated("yes", context)!),
                                      value: ChronicDisease.Found,
                                      groupValue: _chronicDisease,
                                      onChanged: (value){
                                        setState(() {
                                          _chronicDisease = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: 120,
                                    child: RadioListTile(
                                      activeColor: ColorResources.mainColor,
                                      title: Text(getTranslated("no", context)!),
                                      value: ChronicDisease.NotFound,
                                      groupValue: _chronicDisease,
                                      onChanged: (value){
                                        setState(() {
                                          _chronicDisease = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              HSpacer(10),
                              Provider.of<DonationProvider>(context,listen: false).isLoading
                                  ? CircularProgressIndicator()
                                  : Container(
                                width: double.infinity,
                                height: 50.0,
                                child: MaterialButton(
                                    child: Text(
                                      getTranslated("request", context)!,
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    color:ColorResources.mainColor,
                                    onPressed: addUser,
                                ),
                              ),
                              HSpacer(20),
                            ]
                        ),
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  addUser() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      donationModel.ssn = SSNController.text.trim();
      donationModel.firstName = FnameController.text.trim();
      donationModel.lastName = LnameController.text.trim();
      donationModel.age = ageController.text.trim();
      donationModel.bloodType = dropdownValue.toString();
      donationModel.gender = _genderItem.toString();
      donationModel.phone = phoneController.text.trim();
      donationModel.chronicDiseases = _chronicDisease.toString();
      donationModel.location = locationController.text.trim();
      donationModel.startDate = startDateController.text.trim();
      donationModel.endDate = endDateController.text.trim();
      donationModel.latitude = Provider.of<DonationProvider>(context,listen: false).lat;
      donationModel.longitude = Provider.of<DonationProvider>(context,listen: false).lng;
      donationModel.applicationUserId = Provider.of<AuthProvider>(context,listen: false).userData!.userId!;

      await Provider.of<DonationProvider>(context,listen: false).donation(donationModel, route);
    }
  }

  route(bool isRoute,String errorMessage) async {
    if (isRoute) {
      showCustomSnackBar(errorMessage,context,isError: false);
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => NotifyListScreen(
              latitude: donationModel.latitude,
              longitude: donationModel.longitude,
              bloodType: donationModel.bloodType,
              sectionId: Provider.of<SectionProvider>(context,listen: false).sectionId,
          )));
    }
    else {
      showCustomSnackBar(errorMessage,context);
    }
  }
}
