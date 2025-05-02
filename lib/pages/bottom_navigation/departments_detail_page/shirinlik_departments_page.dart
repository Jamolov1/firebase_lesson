import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/post_model.dart';
import '../../../provider/theme.provider.dart';
import '../../../service/rtdb_service.dart';
import '../../details/details_page.dart';

class ShirinlikDepartmentsPage extends StatefulWidget {
  const ShirinlikDepartmentsPage({super.key});

  @override
  State<ShirinlikDepartmentsPage> createState() =>
      _ShirinlikDepartmentsPageState();
}

class _ShirinlikDepartmentsPageState extends State<ShirinlikDepartmentsPage> {
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
    var list = await RTDBService.getShirinlik();
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
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey.shade900 : Colors.white,
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.grey.shade900 : Colors.white,
        title: Text("Categories".tr()),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailsPage(
                          name: items[index].name ?? "",
                          image: items[index].image_url ?? "",
                          recipe: items[index].recipe ?? "",
                          about: items[index].about ?? "");
                    }));
                  },
                  child: Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(items[index].image_url ?? ""),
                            fit: BoxFit.cover)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Center(
                            child: Text(
                              items[index].name ?? "",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
    );
  }

  Widget item_gridview({name, image, onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
