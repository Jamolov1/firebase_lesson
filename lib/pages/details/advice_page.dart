import 'package:firebase_lesson/model/about.dart';
import 'package:firebase_lesson/model/tips_model.dart';
import 'package:firebase_lesson/pages/details/advice_details_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/theme.provider.dart';

class AdvicePage extends StatefulWidget {
  const AdvicePage({super.key});

  @override
  State<AdvicePage> createState() => _AdvicePageState();
}

class _AdvicePageState extends State<AdvicePage> {
  bool isLoading = false;
  int aboutCount = 0;

  void loading() {
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    isLoading = true;

    loading();
    super.initState();
  }

  List<TipsModel> tips = About.setAbout();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey.shade900 : Colors.white,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.grey.shade900 : Colors.white,
        title: Text(
          "Foydali Maslahatlar",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                items(
                    image: "assets/img_1.jpg",
                    name: "Oshxona maslahatlari",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return AdviceDetailsPage(
                          name: 'Oshxona maslahatlari',
                          tipsAbouts: tips[aboutCount].about1,
                        );
                      }));
                    }),
                items(
                  image: "assets/img_2.jpg",
                  name: "Ro'zg'orda asqotadigan tavsiyalar",
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return AdviceDetailsPage(
                        name: "Ro'zg'orda asqotadigan tavsiyalar",
                        tipsAbouts: tips[aboutCount].about2,
                      );
                    }));
                  },
                ),
                items(
                  image: "assets/img_3.jpeg",
                  name: "Oshxona sirlari",
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return AdviceDetailsPage(
                        name: "Oshxona sirlari",
                        tipsAbouts: tips[aboutCount].about3,
                      );
                    }));
                  },
                ),
              ],
            ),
    );
  }

  Widget items({name, image, onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.all(12),
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.black.withOpacity(0.5),
                      Colors.transparent
                    ]),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 60,
                  child: Center(
                    child: Text(
                      name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
