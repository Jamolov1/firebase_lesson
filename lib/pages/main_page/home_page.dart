import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_lesson/pages/bottom_navigation/departments_page.dart';
import 'package:firebase_lesson/pages/bottom_navigation/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../provider/theme.provider.dart';
import '../bottom_navigation/feed_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController();

  int currentIndex = 0;
  bool isDarkMode = false;
  bool isConnectedToInternet = false;

  StreamSubscription? _internetConnectionStreamSubscription;

  void loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadTheme();
    _internetConnectionStreamSubscription =
        InternetConnection().onStatusChange.listen((event) {
          switch (event) {
            case InternetStatus.connected:
              setState(() {
                isConnectedToInternet = true;
              });
              break;
            case InternetStatus.disconnected:
              setState(() {
                isConnectedToInternet = false;
              });
              break;
            default:
              setState(() {
                isConnectedToInternet = false;
              });
              break;
          }
        });
  }

  @override
  void dispose() {
    _internetConnectionStreamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isConnectedToInternet
            ? PageView(
          controller: _controller,
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          children: [
            FeedPage(),
            DepartmentsPage(),
            SettingsPage(),
          ],
        )
            : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Lottie.asset("assets/internet.json",height: 120,width: 120),

              Icon(
                Icons.wifi_off,
                color: Colors.red,
                size: 50,
              ),
              Text(
                "You are not connected to the internet".tr(),
                style: TextStyle(fontSize: 16, color: Colors.red),
              )
            ],
          ),
        ),
        bottomNavigationBar: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return BottomNavigationBar(
              backgroundColor: themeProvider.isDarkMode
                  ? Colors.grey.shade900
                  : Colors.white,
              selectedItemColor: Colors.blue,
              currentIndex: currentIndex,
              onTap: (int index) {
                setState(() {
                  currentIndex = index;
                  _controller.jumpToPage(index);
                });
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.list), label: "Bo'limlar"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "Settings"),
              ],
            );
          },
        ));
  }
}
