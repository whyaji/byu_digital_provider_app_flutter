import 'package:byu_digital_provider_app_flutter/models/internet_package.dart';
import 'package:byu_digital_provider_app_flutter/pages/edit_package_view.dart';
import 'package:byu_digital_provider_app_flutter/services/internet_package_services.dart';
import 'package:byu_digital_provider_app_flutter/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PackageWidget extends StatelessWidget {
  final InternetPackage package;

  const PackageWidget({
    required this.package,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => editInternetPackage(context, package),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                activeColor: Theme.of(context).primaryColor,
                checkColor: Colors.white,
                value: package.isDone,
                onChanged: (_) {
                  final provider = Provider.of<InternetPackageProvider>(context,
                      listen: false);
                  final isDone = provider.toggleInternetPackageStatus(package);

                  Utils.showSnackBar(
                    context,
                    isDone ? 'Masa Aktif Paket Habis' : 'Paket Masih Berjalan',
                  );
                },
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      package.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 22,
                      ),
                    ),
                    if (package.value.isNotEmpty)
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        child: Text(
                          package.value,
                          style: TextStyle(fontSize: 20, height: 1.5),
                        ),
                      ),
                    if (package.active.isNotEmpty)
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        child: Text(
                          package.active,
                          style: TextStyle(fontSize: 20, height: 1.5),
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  void deleteInternetPackage(BuildContext context, InternetPackage package) {
    final provider =
        Provider.of<InternetPackageProvider>(context, listen: false);
    provider.removeInternetPackage(package);

    Utils.showSnackBar(context, 'Paket Dihapus');
  }

  void editInternetPackage(BuildContext context, InternetPackage package) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditInternetPackagePage(package: package),
        ),
      );
}
