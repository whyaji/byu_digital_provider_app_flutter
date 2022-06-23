import 'package:flutter/material.dart';
import '../themes/themes.dart';

class PackageFormWidget extends StatelessWidget {
  final String name;
  final String value;
  final String active;
  final bool enableName;
  final ValueChanged<String> onChangedName;
  final ValueChanged<String> onChangedValue;
  final ValueChanged<String> onChangedActive;
  final VoidCallback onSavedPackage;

  const PackageFormWidget({
    Key? key,
    this.name = '',
    this.value = '',
    this.active = '',
    required this.enableName,
    required this.onChangedName,
    required this.onChangedValue,
    required this.onChangedActive,
    required this.onSavedPackage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildName(),
            SizedBox(height: 8),
            buildValue(),
            SizedBox(height: 8),
            buildActive(),
            SizedBox(height: 8),
            buildButton(),
          ],
        ),
      );

  Widget buildName() => TextFormField(
        maxLines: 1,
        enabled: enableName,
        initialValue: name,
        onChanged: onChangedName,
        validator: (name) {
          if (name!.isEmpty) {
            return 'Nama tidak boleh kosong';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Name',
        ),
      );

  Widget buildValue() => TextFormField(
        maxLines: 1,
        initialValue: value,
        onChanged: onChangedValue,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Kuota',
        ),
      );

  Widget buildActive() => TextFormField(
        maxLines: 1,
        initialValue: active,
        onChanged: onChangedActive,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Active',
        ),
      );

  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(blueColor),
          ),
          onPressed: onSavedPackage,
          child: Text('Save'),
        ),
      );
}
