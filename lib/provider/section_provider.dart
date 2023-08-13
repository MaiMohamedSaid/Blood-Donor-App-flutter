// ignore_for_file: prefer_final_fields
import 'package:flutter/material.dart';
import '../data/model/response/base/api_response.dart';
import '../data/model/response/section_model.dart';
import '../data/repository/section_repo.dart';

class SectionProvider with ChangeNotifier {
  final SectionRepo sectionRepo;
  SectionProvider({required this.sectionRepo});

  bool _isLoading = false;
  int? _sectionId;
  List<SectionModel>? _sectionsList = [];

  bool get isLoading => _isLoading;
  int? get sectionId => _sectionId;
  List<SectionModel>? get sectionsList => _sectionsList;

  /// get Sections
  Future getSections(String? token) async {
    ApiResponse apiResponse = await sectionRepo.getSections(token!);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      SectionData sectionData;
      sectionData = SectionData.fromJson(apiResponse.response!.data);
      _sectionsList = sectionData.sections;
      print("list000 ======>>>>> ${_sectionsList!.length}");
      notifyListeners();
    }
  }

  void saveSectionId(int id){
    _sectionId = id;
    sectionRepo.saveSectionId(id);
  }

  void getSectionId(int id){
    _sectionId = sectionRepo.getSectionId();
  }

}
