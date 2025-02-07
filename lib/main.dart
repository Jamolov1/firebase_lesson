import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_lesson/home_page.dart';
import 'package:firebase_lesson/splash_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyDtOUpFMR1NUYx4hRm1aZCGUA1m8UGWqhE",
    appId: "1:339243909383:android:ee849a2fca613087eac5a2",
    messagingSenderId: "",
    projectId: "fir-first-390a3",
    storageBucket: "fir-first-390a3.firebasestorage.app",
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashPage(),
    );
  }
}
