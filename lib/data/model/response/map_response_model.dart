class MapUserData {
  MapUserData? MapUserModel;

  MapUserData.fromJson(Map<String, dynamic> json) {
    MapUserModel = json['response'] != null
        ? MapUserData.fromJson(json['response'])
        : null;
  }
}

class MapUserModel {
  double? Longitude;
  double? Latitude;
  String? Country;
  String? Governorate;
  String? First_name;
  String? Last_name;
  String? Phone;
  String? Blood_type;
  double? Distance;


  MapUserModel.fromJson(Map<String, dynamic> json) {
    Longitude = json['Longitude'];
    Latitude = json['Latitude'];
    Country = json['Country'];
    Governorate = json['Governorate'];
    First_name = json['First_name'];
    Last_name = json['Last_name'];
    Phone = json['Phone'];
    Blood_type = json['Blood_type'];
    Distance = json['Distance'];
  }

}