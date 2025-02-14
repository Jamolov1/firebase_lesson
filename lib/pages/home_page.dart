import 'package:firebase_lesson/model/post_model.dart';
import 'package:firebase_lesson/pages/details_page.dart';
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
    var list = await RTDBService.getPost();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
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
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext ctx, int index) {
          return Container(
            margin: EdgeInsets.all(6),
            height: MediaQuery.of(context).size.height / 5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: items[index].image_url == null
                        ? Image.asset("assets/img.png")
                        : Image.network(
                            items[index].image_url ?? "",
                            fit: BoxFit.cover,
                          )),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.all(6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        items[index].firstName!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${items[index].lastName!} so'm",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          Container(
                            margin: EdgeInsets.all(6),
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.cyanAccent.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 2,
                                color: Colors.cyan,
                              ),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: Colors.cyan,
                                  ),
                                  Text(
                                    "Zakaz Berish",
                                    style: TextStyle(
                                      color: Colors.cyan,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          );
        },
        itemCount: items.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailsPage();
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
