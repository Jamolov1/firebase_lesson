import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_lesson/model/post_model.dart';
import 'package:firebase_lesson/pages/category_page/details/tort_detail_page.dart';
import 'package:firebase_lesson/pages/details/details_page.dart';
import 'package:firebase_lesson/service/rtdb_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TortPage extends StatefulWidget {
  const TortPage({
    super.key,
  });

  @override
  State<TortPage> createState() => _TortPageState();
}

class _TortPageState extends State<TortPage> {
  List<Post> items = [];
  bool isLoading = false;
  bool isDarkMode = false;

  void loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }

  _apiPostList() async {
    isLoading = true;
    var list = await RTDBService.getTort();
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
    loadTheme();
  }

  void deleteTaom(String id) {
    RTDBService.deleteTort(id).then((value) => {_apiPostList()});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey.shade900 : Colors.white,
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              alignment: Alignment.bottomRight,
              children: [
                ListView.separated(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        items[index].name!,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  "${items[index].recipe!} so'm",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              kIsWeb
                                                  ? IconButton(
                                                      onPressed: () {
                                                        deleteTaom(
                                                            items[index].id ??
                                                                "");
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
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                ),
                kIsWeb
                    ? InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return TortDetailPage();
                          }));
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 80),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : SizedBox()
              ],
            ),
    );
  }
}
