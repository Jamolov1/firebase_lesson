import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/theme.provider.dart';
import 'youtubeview_page.dart';

class DetailsPage extends StatefulWidget {
  String name;
  String image;
  String recipe;
  String about;

  DetailsPage(
      {super.key,
      required this.name,
      required this.image,
      required this.recipe,
      required this.about});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: isDarkMode ? Colors.grey.shade900 : Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.35,
              pinned: true,
              floating: true,
              bottom: TabBar(
                indicatorColor: Color(0xFFF1C623),
                indicatorWeight: 3,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: TextStyle(
                  fontSize: 20,
                  color: Color(0xFFF1C623),
                ),
                unselectedLabelColor: Colors.grey.shade200,
                tabs: [Tab(text: "Masalliqlar"), Tab(text: "Tayyorlash")],
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Image.network(
                      widget.image,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),

                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.black.withOpacity(0.5),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.5),
                            Colors.black.withOpacity(0.2),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(top: 20),
                    //   height: 50,
                    //   width: 50,
                    //   decoration: BoxDecoration(
                    //     color: Colors.grey,
                    //     borderRadius: BorderRadius.only(bottomRight: Radius.circular(10))
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
          body: TabBarView(
            children: [
              ListView(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          "Kerakli Masalliqlar:",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.recipe,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              ListView(
                children: [
                  item_video(
                      image: widget.image,
                      title: widget.name,
                      url: widget.about),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget item_video({image, title, url}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) {
              return YoutubeviewPage(
                url: url,
              );
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(12),
        height: 120,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  height: 120,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 26),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
