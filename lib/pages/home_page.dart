import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_lesson/ichimliklar_page.dart';
import 'package:firebase_lesson/main_page.dart';
import 'package:firebase_lesson/model/post_model.dart';
import 'package:firebase_lesson/pages/shashlik_page.dart';
import 'package:firebase_lesson/salatlar_page.dart';
import 'package:firebase_lesson/service/rtdb_service.dart';
import 'package:firebase_lesson/service/url_service.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController();

  int currentIndex = 0;
  bool isSelected = false;

  List<Post> items = [];

  _apiPostList() async {
    var list = await RTDBService.getTaom();
    setState(() {
      items = list;
    });
  }

  void share() {
    showModalBottomSheet(
        isDismissible: false,
        context: context,
        builder: (ctx) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Chorsu Restoran",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.clear,
                          color: Colors.red,
                          size: 36,
                        ))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    UrlService.launchInBrother(
                        Uri.parse("https://www.instagram.com/"));
                  },
                  child: Expanded(
                      child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Icon(
                              Remix.instagram_line,
                              size: 36,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                            child: Text(
                              "@chorsu_restoran",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                ),
                Divider(
                  color: Colors.grey.shade600,
                ),
                InkWell(
                  onTap: () {
                    UrlService.makePhoneCAll("1080");
                  },
                  child: Expanded(
                      child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Icon(
                              Remix.phone_fill,
                              size: 30,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                            child: Text(
                              "1080",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                ),
                Divider(
                  color: Colors.grey.shade600,
                ),
                InkWell(
                  onTap: () {
                    UrlService.launchInBrother(
                      Uri.parse(
                          "https://www.google.com/maps/place/Chorsu+Milliy+taomlar/@39.0755628,66.8341486,17z/data=!3m1!4b1!4m6!3m5!1s0x3f4c91913a2824cb:0xeceb14de414551b8!8m2!3d39.0755628!4d66.8367235!16s%2Fg%2F11pd2nxcz1?authuser=0&entry=ttu&g_ep=EgoyMDI1MDIxOS4xIKXMDSoASAFQAw%3D%3D"),
                    );
                  },
                  child: Expanded(
                      child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Icon(
                              Remix.map_pin_fill,
                              size: 30,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                            child: Text(
                              "Chorsu Milliy Taomlar",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                ),
                Divider(
                  color: Colors.grey.shade600,
                ),
                InkWell(
                  onTap: () {
                    UrlService.launchInBrother(
                        Uri.parse("https://telegram.org/"));
                  },
                  child: Expanded(
                      child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Icon(
                              Remix.telegram_fill,
                              size: 36,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                            child: Text(
                              "Chorsu Restoran",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                ),
                Divider(
                  color: Colors.grey.shade600,
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Icon(
                            Remix.calendar_check_line,
                            size: 36,
                            color: Colors.indigo,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          child: Text(
                            "Ish kunlari 9:00 dan 22:00 gacha",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          );
        });
  }

  void translation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        Locale currentLocale = context.locale;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          height: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Tilni tanlash".tr(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // Rus tili
              InkWell(
                onTap: () {
                  context.setLocale(const Locale('ru', 'RU'));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.language,
                    size: 30,
                    color: currentLocale == const Locale('ru', 'RU')
                        ? Colors.black
                        : Colors.grey,
                  ),
                  title: Text(
                    "Русский",
                    style: TextStyle(
                      color: currentLocale == const Locale('ru', 'RU')
                          ? Colors.black
                          : Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  trailing: Icon(
                    currentLocale == const Locale('ru', 'RU')
                        ? Icons.check_circle
                        : Icons.circle_outlined,
                    color: currentLocale == const Locale('ru', 'RU')
                        ? Colors.black
                        : Colors.grey,
                  ),
                ),
              ),

              // O'zbek tili
              InkWell(
                onTap: () {
                  context.setLocale(const Locale('uz', 'UZ'));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.language,
                    size: 30,
                    color: currentLocale == const Locale('uz', 'UZ')
                        ? Colors.black
                        : Colors.grey,
                  ),
                  title: Text(
                    "O'zbekcha",
                    style: TextStyle(
                      color: currentLocale == const Locale('uz', 'UZ')
                          ? Colors.black
                          : Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  trailing: Icon(
                    currentLocale == const Locale('uz', 'UZ')
                        ? Icons.check_circle
                        : Icons.circle_outlined,
                    color: currentLocale == const Locale('uz', 'UZ')
                        ? Colors.black
                        : Colors.grey,
                  ),
                ),
              ),

              // Ingliz tili
              InkWell(
                onTap: () {
                  context.setLocale(const Locale('en', 'US'));
                },
                child: ListTile(
                  leading: Icon(
                    Icons.language,
                    size: 30,
                    color: currentLocale == const Locale('en', 'US')
                        ? Colors.black
                        : Colors.grey,
                  ),
                  title: Text(
                    "English",
                    style: TextStyle(
                      color: currentLocale == const Locale('en', 'US')
                          ? Colors.black
                          : Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  trailing: Icon(
                    currentLocale == const Locale('en', 'US')
                        ? Icons.check_circle
                        : Icons.circle_outlined,
                    color: currentLocale == const Locale('en', 'US')
                        ? Colors.black
                        : Colors.grey,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Yopish tugmasi
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 60,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(width: 1, color: Colors.blue),
                    ),
                    child: const Center(
                      child: Text(
                        "Yopish",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiPostList();
  }

  void deleteTaom(String id) {
    RTDBService.deleteTaomlar(id).then((value) => {_apiPostList()});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          leading: SizedBox(),
          title: Text(
            "Restoran Menu".tr(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            // IconButton(
            //     onPressed: () {
            //       AuthService.signOut(context);
            //     },
            //     icon: Icon(
            //       Icons.logout,
            //       color: Colors.red,
            //     ))
            IconButton(
              onPressed: () {
                share();
              },
              icon: Icon(
                Icons.share,
                color: Colors.white,
              ),
            ),
            IconButton(
                onPressed: () {
                  translation(context);
                },
                icon: Icon(
                  Icons.language,
                  color: Colors.white,
                ))
          ],
          bottom: TabBar(
              isScrollable: true,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.white,
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              tabs: [
                Tab(
                  text: "Taomlar".tr(),
                ),
                Tab(
                  text: "Salat".tr(),
                ),
                Tab(
                  text: "Ichimliklar".tr(),
                ),
                Tab(
                  text: "Shashlik".tr(),
                ),
              ]),
        ),
        body: TabBarView(
          children: [
            MainPage(),
            SalatlarPage(),
            IchimliklarPage(),
            ShashlikPage(),
          ],
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: Colors.blue,
        //   unselectedItemColor: Colors.grey,
        //   selectedItemColor: Colors.white,
        //   currentIndex: currentIndex,
        //   onTap: (int index){
        //     setState(() {
        //       currentIndex = index;
        //       _controller.jumpToPage(index);
        //     });
        //   },
        //   items: [
        //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
        //     BottomNavigationBarItem(icon: Icon(Icons.share), label: "share"),
        //   ],
        // ),
      ),
    );
  }
}
