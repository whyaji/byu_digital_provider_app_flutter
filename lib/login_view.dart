import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/account_info.dart';
import 'main.dart';
import 'themes/themes.dart';
import 'data/dummy_data.dart';
import 'home_view.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const firstColor = Color.fromARGB(255, 0, 119, 255);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool remember = false;
  String name = '', nim = '';

  saveToLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('remember', remember);
  }

  saveToLocalAccountStorage(String name, String nim) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);
    prefs.setString('nim', nim);
  }

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
                  'Masuk',
                  style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(
                  flex: 1,
                ),
                const Text(
                  'Login untuk lihat akun kamu yuk',
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
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
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
                TextButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  child: const Text(
                    'Lupa Pasword?',
                  ),
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Masuk'),
                      onPressed: () {
                        login();
                      },
                    )),
                const Spacer(
                  flex: 20,
                ),
                Row(
                  children: <Widget>[
                    const Text('Tidak punya akun?'),
                    TextButton(
                      child: const Text('Daftar'),
                      onPressed: () {
                        //signup screen
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> login() async {
    if (check()) {
      remember = true;
      saveToLocalStorage();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const Home();
      }));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("GAGAL LOGIN"),
        ),
      );
    }
  }

  bool check() {
    for (Map<String, dynamic> item in DummyData.data) {
      if (item['username'] == nameController.text &&
          item['password'] == passwordController.text) {
        nameController.clear();
        passwordController.clear();
        saveToLocalAccountStorage(item['nama'], item['Nim']);
        Account.primary = AccountInfo(name: name, phoneNumber: nim, pulsa: 0);
        return true;
      }
    }
    return false;
  }
}
