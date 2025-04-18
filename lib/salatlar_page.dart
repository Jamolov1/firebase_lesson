import 'package:firebase_lesson/pages/details_page.dart';
import 'package:firebase_lesson/pages/food_detail_page.dart';
import 'package:firebase_lesson/pages/salat_detail_page.dart';
import 'package:firebase_lesson/service/rtdb_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'model/post_model.dart';

class SalatlarPage extends StatefulWidget {
  const SalatlarPage({super.key});

  @override
  State<SalatlarPage> createState() => _SalatlarPageState();
}

class _SalatlarPageState extends State<SalatlarPage> {
  List<Post> items = [];

  _apiPostList() async {
    var list = await RTDBService.getSalat();
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

  void deleteSalat(String id) {
    RTDBService.deleteSalatlar(id).then((value) => {_apiPostList()});
  }

  void dialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "Buyurtma uchun qo'ng'iroq qiling",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "Telefon: 1080",
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12,),
                  Center(
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Center(
                          child: Text(
                            "OK",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext ctx, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return FoodDetailPage(
                  name: items[index].firstName!,
                  image: items[index].image_url!,
                  price: items[index].lastName!,
                  about: items[index].about!,
                );
              }));
            },
            child: Container(
              margin: EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height / 5,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(
                            items[index].image_url ?? "",
                          ),
                          fit: BoxFit.cover),
                    ),
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
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${items[index].lastName!} so'm",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                kIsWeb
                                    ? SizedBox()
                                    : IconButton(
                                    onPressed: () {
                                      deleteSalat(items[index].id ?? "");
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ))
                              ],
                            ),
                            InkWell(
                              onTap: (){
                                dialog();
                              },
                              child: Container(
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
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
          );
        },
        itemCount: items.length,
      ),
      floatingActionButton: kIsWeb
          ? SizedBox()
          : FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return SalatDetailPage();
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
