import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_lesson/pages/bottom_navigation/departments_detail_page/kabob_departments_page.dart';
import 'package:firebase_lesson/pages/bottom_navigation/departments_detail_page/pishiriq_departments_page.dart';
import 'package:firebase_lesson/pages/bottom_navigation/departments_detail_page/shirinlik_departments_page.dart';
import 'package:firebase_lesson/pages/bottom_navigation/departments_detail_page/tort_departments_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/theme.provider.dart';

class SeeAllPage extends StatefulWidget {
  const SeeAllPage({super.key});

  @override
  State<SeeAllPage> createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SeeAllPage> {
  bool isLoading = false;

  void loading() {
    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = true;
    loading();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey.shade900 : Colors.white,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.grey.shade900 : Colors.white,
        title: Text("Categories".tr()),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView(
              padding: EdgeInsets.all(12),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              children: [
                item_gridview(
                    image: "assets/tort.jpg",
                    name: "Tortlar",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return TortDepartmentsPage();
                      }));
                    }),
                item_gridview(
                    image: "assets/pishiriq.jpg",
                    name: "Pishiriqlar",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return PishiriqDepartmentsPage();
                      }));
                    }),
                item_gridview(
                    image: "assets/shirinlik.jpg",
                    name: "Shirinliklar",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return ShirinlikDepartmentsPage();
                      }));
                    }),
                item_gridview(
                    image: "assets/kabob.jpg",
                    name: "Kaboblar",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return KabobDepartmentsPage(
                          name: "Kaboblar",
                        );
                      }));
                    }),
              ],
            ),
    );
  }

  Widget item_gridview({name, image, onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
