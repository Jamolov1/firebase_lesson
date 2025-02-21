import 'package:firebase_lesson/ichimliklar_page.dart';
import 'package:firebase_lesson/main_page.dart';
import 'package:firebase_lesson/model/post_model.dart';
import 'package:firebase_lesson/salatlar_page.dart';
import 'package:firebase_lesson/service/auth_service.dart';
import 'package:firebase_lesson/service/rtdb_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> items = [];

  _apiPostList() async {
    var list = await RTDBService.getTaom();
    setState(() {
      items = list;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiPostList();
  }

  void deleteTaom(String id) {
    RTDBService.deleteTaomlar(id).then((value) => {_apiPostList()});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          leading: SizedBox(),
          title: Text(
            "Home Page",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  AuthService.signOut(context);
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.red,
                ))
          ],
          bottom: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              indicatorColor: Colors.white,
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              tabs: [
                Tab(
                  text: "Taomlar",
                ),
                Tab(
                  text: "Salatlar",
                ),
                Tab(
                  text: "Ichimliklar",
                ),
              ]),
        ),
        body: TabBarView(
          children: [
            MainPage(),
            SalatlarPage(),
            IchimliklarPage(),
          ],
        ),

      ),
    );
  }
}
