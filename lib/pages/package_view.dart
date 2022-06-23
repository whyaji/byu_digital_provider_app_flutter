import 'package:byu_digital_provider_app_flutter/widgets/add_package.dart';
import 'package:byu_digital_provider_app_flutter/widgets/completer_package.dart';
import 'package:byu_digital_provider_app_flutter/widgets/package_list.dart';
import 'package:flutter/material.dart';
import '../themes/themes.dart';

class packageListPage extends StatefulWidget {
  @override
  _packageListPageState createState() => _packageListPageState();
}

class _packageListPageState extends State<packageListPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      PackageListWidget(),
      CompletedListWidget(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Paket Anda"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'Paket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history, size: 28),
            label: 'Riwayat',
          ),
        ],
      ),
      body: tabs[selectedIndex],
    );
  }
}
