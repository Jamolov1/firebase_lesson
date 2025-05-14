import 'dart:async';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_lesson/pages/bottom_navigation/comment_page.dart';
import 'package:firebase_lesson/pages/category_page/category/nonlar_page.dart';
import 'package:firebase_lesson/pages/category_page/see_all_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/post_model.dart';
import '../../service/rtdb_service.dart';
import '../../service/url_service.dart';
import '../../slider_add_page.dart';
import '../category_page/category/kaboblar_page.dart';
import '../category_page/category/pishiriq_page.dart';
import '../category_page/category/shirinliklar_page.dart';
import '../category_page/category/tort_page.dart';

import '../details/details_page.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  bool isSelected = false;

  StreamSubscription? _internetConnectionStreamSubscription;

  List<Post> items = [];
  bool isLoading = false;
  bool isDarkMode = false;

  void loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }

  _apiPostList() async {
    isLoading = true;
    var list = await RTDBService.getSlider();
    setState(() {
      items = list;
    });
    isLoading = false;
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadTheme();
    _apiPostList();
  }

  void deleteTaom(String id) {
    RTDBService.deleteTort(id).then((value) => {_apiPostList()});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: isDarkMode ? Colors.grey.shade900 : Colors.white,
        appBar: AppBar(
          backgroundColor: isDarkMode ? Colors.grey.shade900 : Colors.white,
          leading: SizedBox(),
          title: Text(
            "Taomlar Retsepti".tr(),
            style: TextStyle(
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
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return CommentPage();
                }));
              },
              icon: Icon(
                Icons.comment,
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(top: 12),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CarouselSlider(
                    items: items.map((item) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return DetailsPage(
                                name: item.name ?? "",
                                image: item.image_url ?? "",
                                recipe: item.recipe ?? "",
                                about: item.about ?? "");
                          }));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            item.image_url ?? "",
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.22,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  kIsWeb
                      ? IconButton(
                          padding: EdgeInsets.only(right: 25),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return SliderAddPage();
                            }));
                          },
                          icon: Icon(
                            Icons.add_circle,
                            color: Colors.white,
                            size: 30,
                          ))
                      : SizedBox(),
                ],
              ),
            ),
            DefaultTabController(
                length: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 12, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Categories".tr(),
                            style: TextStyle(fontSize: 18),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return SeeAllPage();
                              }));
                            },
                            child: Text(
                              "See All",
                              style: TextStyle(
                                  color: Color(0xFFF1C623),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context)
                            .copyWith(scrollbars: false, overscroll: false),
                        child: Transform.translate(
                          offset: Offset(-14, 0),
                          child: TabBar(
                              padding: EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              indicatorPadding:
                                  EdgeInsets.symmetric(horizontal: 0),
                              indicatorColor: Color(0xFFF1C623),
                              indicator: BoxDecoration(
                                color: Color(0xFFF1C623),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    width: 1.5, color: Color(0xFFF1C623)),
                              ),
                              indicatorAnimation: TabIndicatorAnimation.elastic,
                              dividerHeight: 0,
                              isScrollable: true,
                              labelColor: Colors.white,
                              unselectedLabelColor: Color(0xFFF1C623),
                              labelPadding: EdgeInsets.only(right: 12),
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                              tabs: [
                                Tab(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFF1C623),
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Center(
                                      child: Text("Tortlar".tr()),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFF1C623),
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Center(
                                      child: Text(
                                        "Pishiriqlar".tr(),
                                      ),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFF1C623),
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Center(
                                      child: Text("Shirinliklar".tr()),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFF1C623),
                                            width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Center(
                                      child: Text("Kaboblar".tr()),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFF1C623),
                                            width: 1.5),
                                        borderRadius:
                                        BorderRadius.circular(30)),
                                    child: Center(
                                      child: Text("Nonlar".tr()),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.55,
                      child: TabBarView(
                        children: [
                          TortPage(),
                          PishiriqPage(),
                          ShirinliklarPage(),
                          KabobPage(),
                          NonlarPage()
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        ));
  }
}
