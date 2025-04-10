import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_lesson/pages/splash_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDLC3iyob3ZgM4UVAfhCyUtY0Mvthw_ZQ8",
            authDomain: "fir-3-f9ae7.firebaseapp.com",
            databaseURL: "https://fir-3-f9ae7-default-rtdb.firebaseio.com",
            projectId: "fir-3-f9ae7",
            storageBucket: "fir-3-f9ae7.firebasestorage.app",
            messagingSenderId: "711982332518",
            appId: "1:711982332518:web:b18297e795ab20b6a60ba7",
            measurementId: "G-C9YNXL8XWL"));
  } else {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA7R_CGcnISudofhPogne2imIbZlFoeEuA",
            appId: "1:711982332518:android:db77b77609fcbbdda60ba7",
            messagingSenderId: "",
            projectId: "fir-3-f9ae7",
            storageBucket: "fir-3-f9ae7.firebasestorage.app"));
  }
  runApp(EasyLocalization(
    supportedLocales: [
      Locale('en','US'),
      Locale('ru','RU'),
      Locale('uz','UZ'),
    ],
    path: 'assets/translations',
    fallbackLocale: Locale('ru', 'RU'),
    startLocale: Locale('ru','RU'),
    saveLocale: true,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Restoran Menu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashPage(),
    );
  }
}
