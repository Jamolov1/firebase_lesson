
import 'package:firebase_lesson/model/post_model.dart';
import 'package:firebase_lesson/pages/home_page.dart';
import 'package:firebase_lesson/salatlar_page.dart';
import 'package:firebase_lesson/service/rtdb_service.dart';
import 'package:flutter/material.dart';


class SalatDetailPage extends StatefulWidget {
  const SalatDetailPage({super.key});

  @override
  State<SalatDetailPage> createState() => _SalatDetailPageState();
}

class _SalatDetailPageState extends State<SalatDetailPage> {
  bool isLoading = false;
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _lastnamecontroller = TextEditingController();
  final TextEditingController _aboutcontroller = TextEditingController();
  final TextEditingController _imgurlcontroller = TextEditingController();

  // File? _image;
  // final picker = ImagePicker();
  //
  // Future _getImage() async {
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     if (pickedFile != null) {
  //       _image = File(pickedFile.path);
  //     } else {
  //       print("No selected Image");
  //     }
  //   });
  // }

  _createPost() {
    String name = _namecontroller.text.trim().toString();
    String lastname = _lastnamecontroller.text.trim().toString();
    String about = _aboutcontroller.text.trim().toString();
    String imgUrl = _imgurlcontroller.text.trim().toString();

    if (name.isEmpty || lastname.isEmpty || about.isEmpty || imgUrl.isEmpty) return;

    _apiCreatePost(name, lastname, about,imgUrl);
  }



  _apiCreatePost(String name, String lastname, String about, String imgUrl) {
    setState(() {
      isLoading = true;
    });
    Post post = Post(
        firstName: name, lastName: lastname, about: about, image_url: imgUrl);

    RTDBService.addSalat(post).then((value) => {
      setState(() {
        isLoading = false;
      }),
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
        return HomePage();
      })),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          "Details Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Text(
            "Create Post",
            style: TextStyle(
              color: Colors.orange,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            margin: EdgeInsets.all(12),
            height: 55,
            color: Colors.grey.shade300,
            child: Center(
              child: TextField(
                controller: _imgurlcontroller,
                decoration: InputDecoration(
                  hintText: "Img Url",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            margin: EdgeInsets.all(12),
            height: 55,
            color: Colors.grey.shade300,
            child: Center(
              child: TextField(
                controller: _namecontroller,
                decoration: InputDecoration(
                  hintText: "Name",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            margin: EdgeInsets.all(12),
            height: 55,
            color: Colors.grey.shade300,
            child: Center(
              child: TextField(
                controller: _lastnamecontroller,
                decoration: InputDecoration(
                  hintText: "Price",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            margin: EdgeInsets.all(12),
            height: 55,
            color: Colors.grey.shade300,
            child: Center(
              child: TextField(
                controller: _aboutcontroller,
                decoration: InputDecoration(
                  hintText: "About",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          isLoading
              ? SizedBox(
            height: 60,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
              : InkWell(
            onTap: () {
              _createPost();
            },
            child: Container(
              margin: EdgeInsets.all(12),
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
