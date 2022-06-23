class InternetPackage {
  final String name;
  String value;
  String active;
  bool isDone;

  InternetPackage(
      {required this.name,
      required this.value,
      required this.active,
      this.isDone = false});
}
