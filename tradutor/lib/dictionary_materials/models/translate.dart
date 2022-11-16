class Translate {
  late String text;
  late String translatedText;
  late bool isStarred;

  Translate(this.text, String translated, this.isStarred) {
    translatedText = translated;
  }
}