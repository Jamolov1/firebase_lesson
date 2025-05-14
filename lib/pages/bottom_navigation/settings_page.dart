import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_lesson/pages/details/advice_page.dart';
import 'package:firebase_lesson/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../provider/theme.provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isLoading = false;


  void signOut() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 70),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                     margin: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "Akkountdan Chiqmoqchimisiz?".tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(),
                  InkWell(
                    onTap: () {
                      AuthService.signOut(context);
                    },
                    child: SizedBox(
                      height: 35,
                      child: Center(
                        child: Text(
                          "Ha".tr(),
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      height: 35,
                      child: Center(
                        child: Text(
                          "Yo'q".tr(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
                    style: const TextStyle(
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
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  title: Text(
                    "Русский",
                    style: TextStyle(
                      color: currentLocale == const Locale('ru', 'RU')
                          ? Colors.blue
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
                        ? Colors.blue
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
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  title: Text(
                    "O'zbekcha",
                    style: TextStyle(
                      color: currentLocale == const Locale('uz', 'UZ')
                          ? Colors.blue
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
                        ? Colors.blue
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
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  title: Text(
                    "English",
                    style: TextStyle(
                      color: currentLocale == const Locale('en', 'US')
                          ? Colors.blue
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
                        ? Colors.blue
                        : Colors.grey,
                  ),
                ),
              ),

              const SizedBox(height: 20),

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

  void loading(){
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
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                const SizedBox(height: 50),
                Center(
                  child:
                      Image.asset("assets/splash.png", height: 130, width: 130),
                ),
                 Text(
                  "Taomlar Retsepti".tr(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const Text("version 5.0"),
                const SizedBox(height: 20),
                ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return AdvicePage();
                    }));
                  },
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  leading: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1.5,
                        color: Colors.orange,
                      ),
                    ),
                    child: const Icon(Icons.star_border, color: Colors.orange),
                  ),
                  title: Text(
                    "Foydali maslahatlar".tr(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    translation(context);
                  },
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  leading: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1.5,
                        color: Colors.orange,
                      ),
                    ),
                    child: const Icon(Icons.language, color: Colors.orange),
                  ),
                  title:Text(
                    "Tilni tanlash".tr(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(),
                ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  leading: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1.5,
                        color: Colors.orange,
                      ),
                    ),
                    child: const Icon(Icons.dark_mode, color: Colors.orange),
                  ),
                  title:  Text(
                    "Qorong'u rejim".tr(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  trailing: Switch(
                    value: Provider.of<ThemeProvider>(context).isDarkMode,
                    onChanged: (value) {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme(value);
                    },
                  ),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    signOut();
                  },
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  leading: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1.5,
                        color: Colors.orange,
                      ),
                    ),
                    child: const Icon(Icons.logout, color: Colors.orange),
                  ),
                  title: Text(
                    "Tizimdan chiqish".tr(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),

              ],
            ),
    );
  }
}
