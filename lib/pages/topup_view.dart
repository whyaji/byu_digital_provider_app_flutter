import 'package:byu_digital_provider_app_flutter/main.dart';
import 'package:flutter/material.dart';
import '../widgets/add_package.dart';
import 'home_view.dart';
import 'package:byu_digital_provider_app_flutter/themes/themes.dart';

class TopUp extends StatefulWidget {
  const TopUp({Key? key}) : super(key: key);
  static late String pulsa;

  @override
  State<TopUp> createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
  List<Widget> getPulsaButtons() {
    List<Widget> pulsaButtons = [];
    List<int> listPulsa = [
      5000,
      10000,
      20000,
      25000,
      50000,
      100000,
      200000,
      500000
    ];
    for (int pulsa in listPulsa) {
      var item = SizedBox(
        width: double.infinity,
        height: 70,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 7, left: 40, bottom: 7, right: 40),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Account.primary.addPulsa(pulsa);
            },
            child: Text(
              "Rp $pulsa",
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ),
      );
      pulsaButtons.add(item);
    }
    return pulsaButtons;
  }

  @override
  Widget build(BuildContext context) {
    List<Tab> myTab = [
      const Tab(
        text: 'Data',
      ),
      const Tab(
        text: 'Topping',
      ),
      const Tab(
        text: 'Pulsa',
      )
    ];

    return DefaultTabController(
      length: myTab.length,
      initialIndex: Home.initialTabTopup,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: blueColor,
          elevation: 0,
          title: Row(
            children: const [
              Spacer(),
              Expanded(
                  child: Text('Pilih Pulsa', style: TextStyle(fontSize: 16))),
              Spacer(),
            ],
          ),
          bottom: TabBar(
            tabs: myTab,
            indicatorWeight: 2,
            indicatorColor: Colors.white,
            indicatorPadding: const EdgeInsets.only(left: 50, right: 50),
          ),
        ),
        body: TabBarView(children: <Widget>[
          Center(
            child: AddPackageDialogWidget(),
          ),
          const Center(
            child: Text("Topping"),
          ),
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage(
                          "assets/images/src_assets_images_imgtopupbannercredit.png"),
                      fit: BoxFit.cover,
                      alignment: Alignment.bottomCenter),
                  color: blueColor,
                ),
                height: 200,
              ),
              Container(
                margin: const EdgeInsets.only(top: 150, left: 20),
                child: Text(
                  "Mau top up pulsa berapa?",
                  style: TextStyle(fontSize: 25, color: whiteColor),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 200),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 241, 241, 241),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListView(
                    children: [
                      Column(
                        children: getPulsaButtons(),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ]),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   elevation: 0.0,
        //   backgroundColor: Home.firstColor,
        // ),
      ),
    );
  }
}
