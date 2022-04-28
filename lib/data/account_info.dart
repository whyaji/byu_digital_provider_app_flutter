class AccountInfo {
  final String name;
  final String phoneNumber;
  int pulsa;

  AccountInfo(
      {required this.name, required this.phoneNumber, required this.pulsa});

  String getName() {
    return name;
  }

  String getPhoneNumber() {
    return phoneNumber;
  }

  int getPulsa() {
    return pulsa;
  }

  void setPulsa(int pulsa) {
    this.pulsa = pulsa;
  }

  void addPulsa(int pulsa) {
    this.pulsa += pulsa;
  }
}
