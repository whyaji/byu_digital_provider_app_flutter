import 'package:byu_digital_provider_app_flutter/models/internet_package.dart';
import 'package:byu_digital_provider_app_flutter/services/internet_package_services.dart';
import 'package:byu_digital_provider_app_flutter/widgets/package_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPackageDialogWidget extends StatefulWidget {
  @override
  _AddPackageDialogWidgetState createState() => _AddPackageDialogWidgetState();
}

class _AddPackageDialogWidgetState extends State<AddPackageDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String value = '';
  String active = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Beli Paket',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 8),
              PackageFormWidget(
                enableName: true,
                onChangedName: (name) => setState(() => this.name = name),
                onChangedValue: (value) => setState(() => this.value = value),
                onChangedActive: (active) =>
                    setState(() => this.active = active),
                onSavedPackage: addPackage,
              ),
            ],
          ),
        ),
      );

  void addPackage() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final internetPackage =
          InternetPackage(name: name, value: value, active: active);

      final provider =
          Provider.of<InternetPackageProvider>(context, listen: false);
      provider.addInternetPackage(internetPackage);

      Navigator.of(context).pop();
    }
  }
}
