import 'package:byu_digital_provider_app_flutter/main.dart';
import 'package:byu_digital_provider_app_flutter/pages/login_view.dart';
import 'package:byu_digital_provider_app_flutter/pages/package_view.dart';
import 'package:byu_digital_provider_app_flutter/pages/topup_view.dart';
import 'package:byu_digital_provider_app_flutter/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../themes/themes.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static int initialTabTopup = 0;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<Tab> myTab = [
      const Tab(
        text: 'U-Plan',
      ),
      const Tab(
        text: 'Update',
      ),
      const Tab(
        text: 'U-Entertainment',
      )
    ];

    return DefaultTabController(
      length: myTab.length,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: transparentColor,
          elevation: 0.0,
          title: Row(
            children: [
              Text(
                  '${Account.primary.getName()}\n${Account.primary.getPhoneNumber()}',
                  style: TextStyle(fontFamily: 'Gilroy', fontSize: 14))
            ],
          ),
          leading: IconButton(
              icon: const Icon(Icons.people),
              onPressed: () async {
                setState(() {});
                if (await AuthenticationService(FirebaseAuth.instance)
                    .signOut()) {
                  Navigator.pop(context);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const Login();
                  }));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("GAGAL LOGOUT"),
                    ),
                  );
                }
              }),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.notifications,
                size: 35,
              ),
            ),
          ],
          bottom: TabBar(
            tabs: myTab,
            indicatorWeight: 2,
            indicatorColor: whiteColor,
            indicatorPadding: const EdgeInsets.only(left: 50, right: 50),
          ),
        ),
        body: TabBarView(children: <Widget>[
          Stack(children: [
            Container(
              decoration: BoxDecoration(
                color: darkBlueColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 200),
              decoration: BoxDecoration(
                color: greyColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  topLeft: Radius.circular(15.0),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25, bottom: 25, right: 25, top: 150),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(
                            color: whiteColor,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                              color: shaddowColor,
                              spreadRadius: 4,
                              blurRadius: 4,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 10, top: 10),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text('Pulsa kamu',
                                        style: TextStyle(
                                            fontFamily: 'Gilroy',
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    Text('Rp ${Account.primary.getPulsa()}',
                                        style: const TextStyle(
                                            fontFamily: 'Gilroy',
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                              const Divider(
                                color: Color.fromARGB(255, 228, 228, 228),
                                thickness: 1.5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: transparentColor,
                                            shadowColor: transparentColor,
                                          ),
                                          onPressed: () async {
                                            Home.initialTabTopup = 0;
                                            await Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                                return const TopUp();
                                              }),
                                            );
                                            setState(() {});
                                          },
                                          child: SizedBox(
                                            height: 60,
                                            child: Column(
                                              children: [
                                                const Image(
                                                  image: AssetImage(
                                                      'assets/images/src_assets_icons_content_sadataaniv.png'),
                                                  width: 25,
                                                ),
                                                SizedBox(height: 10),
                                                Text('Beli Data',
                                                    style: TextStyle(
                                                        fontFamily: 'Gilroy',
                                                        fontSize: 12,
                                                        color: blackColor))
                                              ],
                                            ),
                                          )),
                                      const VerticalDivider(
                                        thickness: 1.5,
                                        color:
                                            Color.fromARGB(255, 228, 228, 228),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: transparentColor,
                                          shadowColor: transparentColor,
                                        ),
                                        onPressed: () async {
                                          Home.initialTabTopup = 1;
                                          await Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                              return const TopUp();
                                            }),
                                          );
                                          setState(() {});
                                        },
                                        child: SizedBox(
                                          height: 60,
                                          child: Column(
                                            children: [
                                              const Image(
                                                image: AssetImage(
                                                    'assets/images/src_assets_icons_content_satoppinganiv.png'),
                                                width: 25,
                                              ),
                                              SizedBox(height: 10),
                                              Text('Beli Topping',
                                                  style: TextStyle(
                                                      fontFamily: 'Gilroy',
                                                      fontSize: 12,
                                                      color: blackColor))
                                            ],
                                          ),
                                        ),
                                      ),
                                      const VerticalDivider(
                                        thickness: 1.5,
                                        color:
                                            Color.fromARGB(255, 228, 228, 228),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: transparentColor,
                                          shadowColor: transparentColor,
                                        ),
                                        onPressed: () async {
                                          Home.initialTabTopup = 2;
                                          await Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) {
                                              return const TopUp();
                                            }),
                                          );
                                          setState(() {});
                                        },
                                        child: SizedBox(
                                          height: 60,
                                          child: Column(
                                            children: [
                                              const Image(
                                                image: AssetImage(
                                                    'assets/images/src_assets_icons_content_satopupaniv.png'),
                                                width: 25,
                                              ),
                                              SizedBox(height: 10),
                                              Text('Beli Pulsa',
                                                  style: TextStyle(
                                                      fontFamily: 'Gilroy',
                                                      fontSize: 12,
                                                      color: blackColor))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: whiteColor,
                            border: Border.all(
                              color: whiteColor,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            boxShadow: [
                              BoxShadow(
                                color: shaddowColor,
                                spreadRadius: 4,
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Expanded(
                                    child: Text('Rincian Pemakaian',
                                        style: TextStyle(
                                            fontFamily: 'Gilroy',
                                            fontSize: 18)),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: transparentColor,
                                      shadowColor: transparentColor,
                                    ),
                                    onPressed: () async {
                                      await Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                          return packageListPage();
                                        }),
                                      );
                                      setState(() {});
                                    },
                                    child: Row(
                                      children: [
                                        Text('Lihat Detail  ',
                                            style: TextStyle(
                                                fontFamily: 'Gilroy',
                                                fontSize: 13,
                                                color: blackColor)),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: blueColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/src_assets_icons_content_sadata.png'),
                                      width: 25,
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      child: Text('Sisa Total Data',
                                          style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              fontSize: 14)),
                                    ),
                                    Text('0 GB',
                                        style: TextStyle(
                                            fontFamily: 'Gilroy',
                                            fontSize: 16)),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: Color.fromARGB(255, 228, 228, 228),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/src_assets_icons_content_satopping.png'),
                                      width: 25,
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      child: Text('Sisa Topping',
                                          style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              fontSize: 14)),
                                    ),
                                    Text('0 GB',
                                        style: TextStyle(
                                            fontFamily: 'Gilroy',
                                            fontSize: 16)),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: Color.fromARGB(255, 228, 228, 228),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/src_assets_icons_content_savoice.png'),
                                      width: 25,
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      child: Text('Sisa telfon',
                                          style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              fontSize: 14)),
                                    ),
                                    Text('0 Menit',
                                        style: TextStyle(
                                            fontFamily: 'Gilroy',
                                            fontSize: 16)),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: Color.fromARGB(255, 228, 228, 228),
                              ),
                            ]),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: whiteColor,
                            border: Border.all(
                              color: whiteColor,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            boxShadow: [
                              BoxShadow(
                                color: shaddowColor,
                                spreadRadius: 4,
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Image(
                                    image: AssetImage(
                                        'assets/images/src_assets_images_imgsendgift.png'),
                                    width: 100,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                        'Kirim dan rikues hadiah\npulsa/kuota? Bisa!',
                                        style: TextStyle(
                                            fontFamily: 'Gilroy',
                                            fontSize: 14)),
                                  ),
                                  Image(
                                    image: AssetImage(
                                        'assets/images/src_assets_icons_content_saarrowright.png'),
                                    width: 25,
                                  )
                                ],
                              )
                            ]),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 25, bottom: 25),
                child: FloatingActionButton(
                  backgroundColor: transparentColor,
                  elevation: 0,
                  onPressed: () {},
                  child: const Image(
                    image: AssetImage(
                        'assets/images/src_assets_icons_content_sahelpchat.png'),
                  ),
                ),
              ),
            )
          ]),
          Stack(children: [
            Container(
              decoration: BoxDecoration(
                color: blueColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 200),
              decoration: BoxDecoration(
                color: greyColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  topLeft: Radius.circular(15.0),
                ),
              ),
            ),
          ]),
          Stack(children: [
            Container(
              decoration: BoxDecoration(
                color: orangeColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 200),
              decoration: BoxDecoration(
                color: greyColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  topLeft: Radius.circular(15.0),
                ),
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
