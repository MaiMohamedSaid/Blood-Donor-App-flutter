
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../data/model/body/needy_model.dart';
import '../../../../localization/language_constrants.dart';
import '../../../../provider/auth_provider.dart';
import '../../../../provider/needs_provider.dart';
import '../../../../provider/section_provider.dart';
import '../../../../util/color_resources.dart';
import '../../../../util/images.dart';
import '../../../baseWidget/show_custom_snakbar.dart';
import '../../../baseWidget/spacer.dart';
import '../../../baseWidget/textfield/custom_textfield.dart';
import '../../Donation/Donation.dart';
import '../../Notification/notify_list.dart';
import '../../home/home_screen.dart';
import '../../map/current_location.dart';

const List<String> list = <String>[ 'AP', 'A-','BP','B-','ABP','AB-','OP','O-'];

class NeedyBloodScreen extends StatefulWidget {
  @override
  State<NeedyBloodScreen> createState() => _NeedyBloodScreenState();
}
class _NeedyBloodScreenState extends State<NeedyBloodScreen> {
  var FnameController = TextEditingController();
  var LnameController = TextEditingController();
  var phoneController = TextEditingController();
  var SSNController = TextEditingController();
  var genderController = TextEditingController();
  var ageController = TextEditingController();
  var bloodTypeController = TextEditingController();
  var locationController = TextEditingController();
  var reportController = TextEditingController();
  var fileController = TextEditingController();
  var quantityController = TextEditingController();
  var chronicDiseasesController = TextEditingController();
  var dateController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  PlatformFile? pickedFile;
  Future selectFile() async{
    final result = await FilePicker.platform.pickFiles();
    if(result == null)return;
    setState(() {
      pickedFile = result.files.first;
    });
  }
  final ButtonStyle style =
  ElevatedButton.styleFrom(backgroundColor: ColorResources.mainColor);

  String dropdownValue = list.first;
  Gender? _genderItem = Gender.Male;
  NeedyModel needyModel = NeedyModel();

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
                                getTranslated("needy",context)!,
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
                                  validatorMessage: "first name must not be empty",
                                ),
                              ),
                              HSpacer(15),
                              Container(
                                color: Color(0XFFF4F8FB),
                                child: CustomTextField(
                                  controller: LnameController,
                                  textInputType: TextInputType.text,
                                  labelText: getTranslated("lastname", context)!,
                                  validatorMessage:"last name must not be empty",
                                ),
                              ),
                              HSpacer(15),
                              Row(
                                children: [
                                  Container(
                                    width: 160,
                                    color: Color(0XFFF4F8FB),
                                    child:  CustomTextField(
                                      controller: ageController,
                                      textInputType: TextInputType.number,
                                      labelText: getTranslated("age", context)!,
                                      validatorMessage:"Age must not be empty",
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
                                      title: Text("Male"),
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
                                      title: Text("Female"),
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


                              HSpacer(15),
                              Container(
                                color: Color(0XFFF4F8FB),
                                child: CustomTextField(
                                  controller: phoneController,
                                  textInputType: TextInputType.number,
                                  labelText: getTranslated("phone", context)!,
                                  validatorMessage:"Phone must not be empty",
                                ),
                              ),
                              HSpacer(15),
                              if(pickedFile != null)
                                Container(
                                  color: Colors.white,
                                  child: Text(pickedFile!.name),
                                ),
                              Row(
                                children: [
                                  Text(getTranslated("file", context)!),
                                  WSpacer(5),
                                  ElevatedButton(
                                      onPressed: selectFile,
                                      style:style,
                                      child: Text(getTranslated("selectfile", context)!)

                                  ),
                                ],
                              ),

                              HSpacer(15),
                              Container(
                                color: Color(0XFFF4F8FB),
                                child: CustomTextField(
                                  controller: reportController,
                                  textInputType: TextInputType.multiline,
                                  labelText: getTranslated("hospitalreport", context)!,
                                  validatorMessage:"HospitalReport must not be empty",
                                ),
                              ),
                              HSpacer(15),
                              HSpacer(15),
                              Container(
                                color: Color(0XFFF4F8FB),
                                child: CustomTextField(
                                  controller: quantityController,
                                  textInputType: TextInputType.number,
                                  labelText: getTranslated("quantity", context)!,
                                  validatorMessage:"Quantity must not be empty",
                                ),
                              ),
                              HSpacer(15),
                              Container(
                                color: Color(0XFFF4F8FB),
                                child: CustomTextField(
                                  controller: dateController,
                                  textInputType: TextInputType.datetime,
                                  labelText: getTranslated("date", context)!,
                                  validatorMessage:"Date must not be empty",
                                ),
                              ),
                              HSpacer(15),
                              Container(
                                color: Color(0XFFF4F8FB),
                                child: CustomTextField(
                                  controller: locationController,
                                  textInputType: TextInputType.text,
                                  labelText: getTranslated("location", context)!,
                                  validatorMessage:"Location must not be empty",
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
                              HSpacer(15),
                              HSpacer(10),
                              Provider.of<NeedsProvider>(context,listen: false).isLoading
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

      needyModel.firstName = FnameController.text.trim();
      needyModel.lastName = LnameController.text.trim();
      needyModel.ssn = SSNController.text.trim();
      needyModel.age = ageController.text.trim();
      needyModel.bloodType = dropdownValue.toString();
      needyModel.gender = _genderItem.toString();
      needyModel.phone = phoneController.text.trim();
      needyModel.location = locationController.text.trim();
      needyModel.hospitalReport = reportController.text.trim();
      needyModel.quantity = quantityController.text.trim();
      needyModel.latitude = Provider.of<NeedsProvider>(context,listen: false).lat;
      needyModel.longitude = Provider.of<NeedsProvider>(context,listen: false).lng;
      needyModel.applicationUserId = Provider.of<AuthProvider>(context,listen: false).userData!.userId!;
      needyModel.sectionId =  Provider.of<SectionProvider>(context,listen: false).sectionId!;
      needyModel.date = dateController.text.trim();


      await Provider.of<NeedsProvider>(context,listen: false).Needy(needyModel, route);
    }
  }

  route(bool isRoute,String errorMessage) async {
    if (isRoute) {
      showCustomSnackBar(errorMessage,context,isError: false);
      Navigator.push(context,
          MaterialPageRoute(builder: (_) => NotifyListScreen(
            latitude: needyModel.latitude,
            longitude: needyModel.longitude,
            bloodType: needyModel.bloodType,
            sectionId: Provider.of<SectionProvider>(context,listen: false).sectionId,
          )));
    }
    else {
      showCustomSnackBar(errorMessage,context);
    }
  }
}
