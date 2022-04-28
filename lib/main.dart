import 'package:shared_preferences/shared_preferences.dart';

import 'data/account_info.dart';
import 'home_view.dart';
import 'login_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String title = 'by.U';
  bool remember = false;
  String name = '', nim = '';

  // This widget is the root of your application.
  Future<bool> loadRemember() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('remember') ?? false;
  }

  Future<String> loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('name') ?? '';
  }

  Future<String> loadNim() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('nim') ?? '';
  }

  @override
  void initState() {
    loadRemember().then((value) {
      remember = value;
      setState(() {});
    });
    loadName().then((value) {
      name = value;
      setState(() {});
    });
    loadNim().then((value) {
      nim = value;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: initialPages(),
    );
  }

  Widget initialPages() {
    setState(() {});
    if (remember) {
      Account.primary = AccountInfo(name: name, phoneNumber: nim, pulsa: 0);
      return Pages.home;
    } else {
      return Pages.login;
    }
  }
}

class Account {
  static late AccountInfo primary;
}

class Pages {
  static const home = Home();
  static const login = Login();
}
