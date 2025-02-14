import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_lesson/model/post_model.dart';

class RTDBService {
  static final _database = FirebaseDatabase.instance.ref();

  static Future<Stream<DatabaseEvent>> addPost(Post post) async {
    _database.child("post").push().set(post.toJson());
    return _database.onChildAdded;
  }

  static Future<List<Post>> getPost() async {
    List<Post> items = [];
    Query query = _database.ref.child("post");
    DatabaseEvent event = await query.once();

    var snapshot = event.snapshot;

    for (var child in snapshot.children) {
      var jsonPost = jsonEncode(child.value);
      Map<String, dynamic> map = jsonDecode(jsonPost);
      var post = Post(
          firstName: map['firstName'],
          lastName: map["lastName"],
          image_url: map["image_url"],
          about: map["about"]);

      items.add(post);
    }

    return items;
  }
}
