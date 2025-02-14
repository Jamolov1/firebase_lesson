import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_lesson/pages/splash_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCUz-FVGf6xpB-KuNZCy-pjnzvx1CrSEbs",
            authDomain: "fir-first-390a3.firebaseapp.com",
            databaseURL: "https://fir-first-390a3-default-rtdb.firebaseio.com",
            projectId: "fir-first-390a3",
            storageBucket: "fir-first-390a3.firebasestorage.app",
            messagingSenderId: "339243909383",
            appId: "1:339243909383:web:14c615840dd88e94eac5a2"));
  } else {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDtOUpFMR1NUYx4hRm1aZCGUA1m8UGWqhE",
            appId: "1:339243909383:android:ee849a2fca613087eac5a2",
            messagingSenderId: "",
            projectId: "fir-first-390a3",
            storageBucket: "fir-first-390a3.firebasestorage.app"));
  }
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
