import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_lesson/model/post_model.dart';

class RTDBService {
  static final _database = FirebaseDatabase.instance.ref();

  static Future<Stream<DatabaseEvent>> addTaom(Post post) async {
    final referense = _database.child("taom").push();
    post.id=referense.key;
    await referense.set(post.toJson());
    return _database.onChildAdded;
  }


  static Future<Stream<DatabaseEvent>> addSalat(Post post) async {
    final referense = _database.child("salat").push();
    post.id=referense.key;
    await referense.set(post.toJson());
    return _database.onChildAdded;
  }


  static Future<Stream<DatabaseEvent>> addIchimlik(Post post) async {
    final referense = _database.child("ichimlik").push();
    post.id=referense.key;
    await referense.set(post.toJson());
    return _database.onChildAdded;
  }

  static Future<List<Post>> getTaom() async {
    List<Post> items = [];
    Query query = _database.ref.child("taom");
    DatabaseEvent event = await query.once();

    var snapshot = event.snapshot;

    for (var child in snapshot.children) {
      var jsonPost = jsonEncode(child.value);
      Map<String, dynamic> map = jsonDecode(jsonPost);
      var post = Post(
        id: child.key,
          firstName: map['firstName'],
          lastName: map["lastName"],
          image_url: map["image_url"],
          about: map["about"]);

      items.add(post);
    }

    return items;
  }

  static Future<List<Post>> getSalat() async {
    List<Post> items = [];
    Query query = _database.ref.child("salat");
    DatabaseEvent event = await query.once();

    var snapshot = event.snapshot;

    for (var child in snapshot.children) {
      var jsonPost = jsonEncode(child.value);
      Map<String, dynamic> map = jsonDecode(jsonPost);
      var post = Post(
          id: child.key,
          firstName: map['firstName'],
          lastName: map["lastName"],
          image_url: map["image_url"],
          about: map["about"]);

      items.add(post);
    }

    return items;
  }

  static Future<List<Post>> getIchimlik() async {
    List<Post> items = [];
    Query query = _database.ref.child("ichimlik");
    DatabaseEvent event = await query.once();

    var snapshot = event.snapshot;

    for (var child in snapshot.children) {
      var jsonPost = jsonEncode(child.value);
      Map<String, dynamic> map = jsonDecode(jsonPost);
      var post = Post(
          id: child.key,
          firstName: map['firstName'],
          lastName: map["lastName"],
          image_url: map["image_url"],
          about: map["about"]);

      items.add(post);
    }

    return items;
  }

  static Future<void> deleteTaomlar(String id) async {
    await _database
        .child("taom")
        .child(id)
        .remove()
        .then((value) => {print("item uchirildi")});
  }

  static Future<void> deleteSalatlar(String id) async {
    await _database
        .child("salat")
        .child(id)
        .remove()
        .then((value) => {print("item uchirildi")});
  }

  static Future<void> deleteIchimliklar(String id) async {
    await _database
        .child("ichimlik")
        .child(id)
        .remove()
        .then((value) => {print("item uchirildi")});
  }
}
