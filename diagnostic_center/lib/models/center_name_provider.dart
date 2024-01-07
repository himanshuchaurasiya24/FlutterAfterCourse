class CenterNameProvider {
  String centerName = '';
  String centerAddress = '';
  String centerEmail = '';
  void updateInfo(String name, String address, String email) {
    centerName = name;
    centerAddress = address;
    centerEmail = email;
  }

  String get centerInfoName => centerName;
  String get centerInfoAddress => centerAddress;
  String get centerInfoEmail => centerEmail;
}
