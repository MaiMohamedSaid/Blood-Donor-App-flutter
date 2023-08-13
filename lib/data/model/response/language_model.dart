class LanguageModel {
  String? imageUrl;
  String languageName;
  String languageCode;
  String countryCode;

  LanguageModel(
      {this.imageUrl,
      required this.languageName,
      required this.countryCode,
      required this.languageCode});
}
