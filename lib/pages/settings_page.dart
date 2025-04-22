import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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

  void darkMode(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        Locale currentLocale = context.locale;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(child: IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_down,size: 30,)),),
              InkWell(
                onTap: () {

                },
                child: ListTile(
                  leading: Icon(
                    Icons.language,
                    size: 30,
                    color:
                        Colors.black

                  ),
                  title: Text(
                    "",
                    style: TextStyle(
                      color:
                          Colors.black,

                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  trailing: Icon(


                    Icons.circle_outlined,
                    color:
                         Colors.black
                  ),
                ),
              ),

              // O'zbek tili
              InkWell(
                onTap: () {

                },
                child: ListTile(
                  leading: Icon(
                      Icons.language,
                      size: 30,
                      color:
                      Colors.black

                  ),
                  title: Text(
                    "",
                    style: TextStyle(
                      color:
                      Colors.black,

                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  trailing: Icon(


                      Icons.circle_outlined,
                      color:
                      Colors.black
                  ),
                ),
              ),

              // Ingliz tili
              InkWell(
                onTap: () {

                },
                child: ListTile(
                  leading: Icon(
                      Icons.language,
                      size: 30,
                      color:
                      Colors.black

                  ),
                  title: Text(
                    "",
                    style: TextStyle(
                      color:
                      Colors.black,

                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  trailing: Icon(


                      Icons.circle_outlined,
                      color:
                      Colors.black
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Image.asset("assets/splash.png", height: 130, width: 130),
          ),
          Text(
            "Taomlar Retsepti",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Text("version 5.0"),
          SizedBox(height: 20),
          item_setting(name: "Foydali maslahatlar", onTap: () {}),
          Divider(),
          item_setting(
              name: "Tilni tanlash",
              onTap: () {
                translation(context);
              }),
          Divider(),
          item_setting(name: "Qorong'u rejim",onTap: (){
            darkMode(context);
          }),
          Divider(),
          item_setting(name: "Tizimdan chiqish",onTap: (){}),
        ],
      ),
    );
  }

  Widget item_setting({name, onTap}) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      leading: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 1.5),
        ),
        child: Icon(Icons.star_border, color: Colors.orange),
      ),
      title: Text(
        name,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
