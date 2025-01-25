extension StringExtension on String {
  String capitalizeFirstLetter() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String capitalizeEachWord() {
    return split(" ").map((e) => e.capitalizeFirstLetter()).toString();
  }
}
