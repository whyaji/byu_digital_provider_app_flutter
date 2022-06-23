import 'package:byu_digital_provider_app_flutter/models/internet_package.dart';
import 'package:flutter/cupertino.dart';

class InternetPackageProvider extends ChangeNotifier {
  final List<InternetPackage> _internetPackages = [
    InternetPackage(
      name: 'Internet OMG',
      value: '20 GB',
      active: '30 hari',
    ),
    InternetPackage(
      name: 'Internet Sakti',
      value: '10 GB',
      active: '30 hari',
    ),
  ];

  List<InternetPackage> get internetPackage =>
      _internetPackages.where((package) => package.isDone == false).toList();

  List<InternetPackage> get internetPackageCompleted =>
      _internetPackages.where((package) => package.isDone == true).toList();

  void addInternetPackage(InternetPackage package) {
    _internetPackages.add(package);

    notifyListeners();
  }

  void removeInternetPackage(InternetPackage package) {
    _internetPackages.remove(package);

    notifyListeners();
  }

  bool toggleInternetPackageStatus(InternetPackage package) {
    package.isDone = !package.isDone;
    notifyListeners();

    return package.isDone;
  }

  void updateInternetPackage(
      InternetPackage package, String value, String active) {
    package.value = value;
    package.active = active;

    notifyListeners();
  }
}
