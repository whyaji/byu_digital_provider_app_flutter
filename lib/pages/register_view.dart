import 'dart:math';

import 'package:byu_digital_provider_app_flutter/pages/login_view.dart';
import 'package:byu_digital_provider_app_flutter/services/auth.dart';
import 'package:byu_digital_provider_app_flutter/themes/themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nomorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: transparentColor,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Spacer(),
            Text('Buat Akun',
                style: TextStyle(
                    fontSize: 20, fontFamily: 'Gilroy', color: blackColor)),
            const Spacer()
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: greyColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 100, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Daftar',
                  style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(
                  flex: 1,
                ),
                const Text(
                  'Daftar dan join by.U',
                  style: TextStyle(fontFamily: 'Gilroy', fontSize: 15),
                ),
                const Spacer(
                  flex: 2,
                ),
                const Center(
                  child: Image(
                    image: AssetImage(
                        'assets/images/src_assets_images_imgauthregister.png'),
                    width: 250,
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nama Lengkap',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    enabled: false,
                    controller: nomorController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nomor kamu nanti',
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: ElevatedButton.icon(
                      icon: const Icon(
                          Icons.refresh), //icon data for elevated button
                      label: const Text("Refresh nomor"), //label text
                      style: ElevatedButton.styleFrom(
                          primary: Colors
                              .blueAccent //elevated btton background color
                          ),
                      onPressed: () {
                        final updatedText = insertNumber();
                        nomorController.value = nomorController.value.copyWith(
                          text: updatedText,
                          selection: TextSelection.collapsed(
                              offset: updatedText.length),
                        );
                      },
                    )),
                const Spacer(
                  flex: 5,
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Daftar'),
                      onPressed: () {
                        register();
                      },
                    )),
                const Spacer(
                  flex: 30,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  AuthenticationService service = AuthenticationService(FirebaseAuth.instance);

  Future<void> register() async {
    if (await service.signUp(
        email: emailController.text, password: passwordController.text)) {
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Login()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("GAGAL REGISTER"),
        ),
      );
    }
  }

  String insertNumber() {
    String number = '0851';
    var rndnumber = "";
    var rnd = Random();
    for (var i = 0; i < 8; i++) {
      rndnumber = rndnumber + rnd.nextInt(9).toString();
    }
    return number + rndnumber.toString();
  }
}
