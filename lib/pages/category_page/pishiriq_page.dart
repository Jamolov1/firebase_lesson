import 'package:firebase_lesson/pages/details_page.dart';
import 'package:firebase_lesson/service/rtdb_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../model/post_model.dart';
import 'details/pishiriq_detail_page.dart';


class PishiriqPage extends StatefulWidget {
  const PishiriqPage({super.key});

  @override
  State<PishiriqPage> createState() => _PishiriqPageState();
}

class _PishiriqPageState extends State<PishiriqPage> {
  List<Post> items = [];
  bool isLoading = false;

  _apiPostList() async {
    isLoading = true;
    var list = await RTDBService.getPishiriq();
    setState(() {
      items = list;
    });
    isLoading = false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiPostList();
  }

  void deleteSalat(String id) {
    RTDBService.deletePishiriq(id).then((value) => {_apiPostList()});
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

  void deletePishiriq(String id) {
    RTDBService.deletePishiriq(id).then((value) => {_apiPostList()});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading?Center(child: CircularProgressIndicator(),):ListView.builder(
        itemBuilder: (BuildContext ctx, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailsPage(
                  name: items[index].name!,
                  image: items[index].image_url!,
                  recipe: items[index].recipe!,
                  about: items[index].about!,
                );
              }));
            },
            child: Container(
              margin: EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height / 7,
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(
                                  items[index].image_url ?? "",
                                ),
                                fit: BoxFit.cover)),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.all(6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              items[index].name!,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "${items[index].recipe!} so'm",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,

                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    kIsWeb
                                        ? IconButton(
                                        onPressed: () {
                                          deletePishiriq(items[index].id ?? "");
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ))
                                        : SizedBox(),
                                  ],
                                ),

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
          ? FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return PishiriqDetailPage();
          }));
        },
        child: Icon(Icons.add),
      )
          : SizedBox()
    );
  }
}
