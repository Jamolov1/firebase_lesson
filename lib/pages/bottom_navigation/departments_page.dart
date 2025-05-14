import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_lesson/pages/bottom_navigation/departments_detail_page/kabob_departments_page.dart';
import 'package:firebase_lesson/pages/bottom_navigation/departments_detail_page/non_departments_page.dart';
import 'package:firebase_lesson/pages/bottom_navigation/departments_detail_page/pishiriq_departments_page.dart';
import 'package:firebase_lesson/pages/bottom_navigation/departments_detail_page/shirinlik_departments_page.dart';
import 'package:firebase_lesson/pages/bottom_navigation/departments_detail_page/tort_departments_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/theme.provider.dart';

class DepartmentsPage extends StatefulWidget {
  const DepartmentsPage({super.key});

  @override
  State<DepartmentsPage> createState() => _DepartmentsPageState();
}

class _DepartmentsPageState extends State<DepartmentsPage> {
  bool isLoading = false;
  bool isDarkMode = false;

  void loading() {
    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();

    isLoading = true;
    loading();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey.shade900 : Colors.white,
      appBar: isLoading
          ? AppBar( backgroundColor: isDarkMode ? Colors.grey.shade900 : Colors.white,)
          : AppBar(
        backgroundColor: isDarkMode ? Colors.grey.shade900 : Colors.white,
              title: Text(
                "Bo'limlar".tr(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                departments_item(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return TortDepartmentsPage();
                    }));
                  },
                  image: "assets/tort.jpg",
                  name: "Tortlar".tr(),
                ),
                Divider(),
                departments_item(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return PishiriqDepartmentsPage();
                    }));
                  },
                  image: "assets/pishiriq.jpg",
                  name: "Pishiriqlar".tr(),
                ),
                Divider(),
                departments_item(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return ShirinlikDepartmentsPage();
                      }));
                    },
                    image: "assets/shirinlik.jpg",
                    name: "Shirinliklar".tr()),
                Divider(),
                departments_item(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return KabobDepartmentsPage(name: "Kaboblar".tr(),);
                    }));
                  },
                  image: "assets/kabob.jpg",
                  name: "Kaboblar".tr(),
                ),
                Divider(),
                departments_item(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return NonDepartmentsPage(name: 'Patir non'.tr(),);
                    }));
                  },
                  image: "assets/non.jpg",
                  name: "Nonlar".tr(),
                ),
              ],

            ),
    );
  }

  Widget departments_item({image, name, onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 100,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(image), fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
