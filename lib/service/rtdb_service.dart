import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_lesson/model/post_model.dart';

class RTDBService {
  static final _database = FirebaseDatabase.instance.ref();

  static Future<Stream<DatabaseEvent>> addSlider(Post post) async {
    final referense = _database.child("slider").push();
    post.id=referense.key;
    await referense.set(post.toJson());
    return _database.onChildAdded;
  }


  static Future<Stream<DatabaseEvent>> addTort(Post post) async {
    final referense = _database.child("tortlar").push();
    post.id=referense.key;
    await referense.set(post.toJson());
    return _database.onChildAdded;
  }


  static Future<Stream<DatabaseEvent>> addPishiriq(Post post) async {
    final referense = _database.child("pishiriqlar").push();
    post.id=referense.key;
    await referense.set(post.toJson());
    return _database.onChildAdded;
  }


  static Future<Stream<DatabaseEvent>> addShirinlik(Post post) async {
    final referense = _database.child("shirinliklar").push();
    post.id=referense.key;
    await referense.set(post.toJson());
    return _database.onChildAdded;
  }

  static Future<Stream<DatabaseEvent>> addKabob(Post post) async {
    final referense = _database.child("kaboblar").push();
    post.id=referense.key;
    await referense.set(post.toJson());
    return _database.onChildAdded;
  }

  static Future<List<Post>> getSlider() async {
    List<Post> items = [];
    Query query = _database.ref.child("slider");
    DatabaseEvent event = await query.once();

    var snapshot = event.snapshot;

    for (var child in snapshot.children) {
      var jsonPost = jsonEncode(child.value);
      Map<String, dynamic> map = jsonDecode(jsonPost);
      var post = Post(
          id: child.key,
          name: map['name'],
          recipe: map["recipe"],
          image_url: map["image_url"],
          about: map["about"]);

      items.add(post);
    }

    return items;
  }

  static Future<List<Post>> getTort() async {
    List<Post> items = [];
    Query query = _database.ref.child("tortlar");
    DatabaseEvent event = await query.once();

    var snapshot = event.snapshot;

    for (var child in snapshot.children) {
      var jsonPost = jsonEncode(child.value);
      Map<String, dynamic> map = jsonDecode(jsonPost);
      var post = Post(
        id: child.key,
          name: map['name'],
          recipe: map["recipe"],
          image_url: map["image_url"],
          about: map["about"]);

      items.add(post);
    }

    return items;
  }

  static Future<List<Post>> getPishiriq() async {
    List<Post> items = [];
    Query query = _database.ref.child("pishiriqlar");
    DatabaseEvent event = await query.once();

    var snapshot = event.snapshot;

    for (var child in snapshot.children) {
      var jsonPost = jsonEncode(child.value);
      Map<String, dynamic> map = jsonDecode(jsonPost);
      var post = Post(
          id: child.key,
          name: map['name'],
          recipe: map["recipe"],
          image_url: map["image_url"],
          about: map["about"]);

      items.add(post);
    }

    return items;
  }

  static Future<List<Post>> getShirinlik() async {
    List<Post> items = [];
    Query query = _database.ref.child("shirinliklar");
    DatabaseEvent event = await query.once();

    var snapshot = event.snapshot;

    for (var child in snapshot.children) {
      var jsonPost = jsonEncode(child.value);
      Map<String, dynamic> map = jsonDecode(jsonPost);
      var post = Post(
          id: child.key,
          name: map['name'],
          recipe: map["recipe"],
          image_url: map["image_url"],
          about: map["about"]);

      items.add(post);
    }

    return items;
  }

  static Future<List<Post>> getKabob() async {
    List<Post> items = [];
    Query query = _database.ref.child("kaboblar");
    DatabaseEvent event = await query.once();

    var snapshot = event.snapshot;

    for (var child in snapshot.children) {
      var jsonPost = jsonEncode(child.value);
      Map<String, dynamic> map = jsonDecode(jsonPost);
      var post = Post(
          id: child.key,
          name: map['name'],
          recipe: map["recipe"],
          image_url: map["image_url"],
          about: map["about"]);

      items.add(post);
    }

    return items;
  }

  static Future<void> deleteTort(String id) async {
    await _database
        .child("tortlar")
        .child(id)
        .remove()
        .then((value) => {print("item uchirildi")});
  }

  static Future<void> deletePishiriq(String id) async {
    await _database
        .child("pishiriqlar")
        .child(id)
        .remove()
        .then((value) => {print("item uchirildi")});
  }

  static Future<void> deleteShirinliklar(String id) async {
    await _database
        .child("shirinliklar")
        .child(id)
        .remove()
        .then((value) => {print("item uchirildi")});
  }

  static Future<void> deleteKabob(String id) async {
    await _database
        .child("kaboblar")
        .child(id)
        .remove()
        .then((value) => {print("item uchirildi")});
  }
}
