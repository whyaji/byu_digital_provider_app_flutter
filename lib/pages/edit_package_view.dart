import 'package:byu_digital_provider_app_flutter/models/internet_package.dart';
import 'package:byu_digital_provider_app_flutter/services/internet_package_services.dart';
import 'package:byu_digital_provider_app_flutter/widgets/package_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditInternetPackagePage extends StatefulWidget {
  final InternetPackage package;

  const EditInternetPackagePage({Key? key, required this.package})
      : super(key: key);

  @override
  _EditInternetPackagePageState createState() =>
      _EditInternetPackagePageState();
}

class _EditInternetPackagePageState extends State<EditInternetPackagePage> {
  final _formKey = GlobalKey<FormState>();

  late String name;
  late String value;
  late String active;

  @override
  void initState() {
    super.initState();

    name = widget.package.name;
    value = widget.package.value;
    active = widget.package.active;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Edit Paket'),
          actions: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                final provider = Provider.of<InternetPackageProvider>(context,
                    listen: false);
                provider.removeInternetPackage(widget.package);

                Navigator.of(context).pop();
              },
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: PackageFormWidget(
              name: name,
              value: value,
              active: active,
              enableName: false,
              onChangedName: (name) => setState(() => this.name = name),
              onChangedValue: (value) => setState(() => this.value = value),
              onChangedActive: (active) => setState(() => this.active = active),
              onSavedPackage: savePackage,
            ),
          ),
        ),
      );

  void savePackage() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final provider =
          Provider.of<InternetPackageProvider>(context, listen: false);

      provider.updateInternetPackage(widget.package, value, active);

      Navigator.of(context).pop();
    }
  }
}
