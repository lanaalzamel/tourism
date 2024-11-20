final List<LanguageModel> languages = [
  LanguageModel("English", "en"),
  LanguageModel("Arabic", "ar"),
];

class LanguageModel {
  LanguageModel(
    this.language,
    this.symbol,
  );

  String language;
  String symbol;
}
