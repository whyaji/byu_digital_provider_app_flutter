import 'package:byu_digital_provider_app_flutter/services/internet_package_services.dart';
import 'package:byu_digital_provider_app_flutter/widgets/package_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompletedListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<InternetPackageProvider>(context);
    final packages = provider.internetPackageCompleted;

    return packages.isEmpty
        ? Center(
            child: Text(
              'Tidak ada riawayat pembelian paket',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(height: 8),
            itemCount: packages.length,
            itemBuilder: (context, index) {
              final package = packages[index];
              return PackageWidget(package: package);
            },
          );
  }
}
