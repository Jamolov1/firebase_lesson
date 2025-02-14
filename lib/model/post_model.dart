class Post {
  String? firstName;
  String? lastName;
  String? about;
  String? image_url;

  Post({this.firstName, this.lastName, this.about, this.image_url});

  Post.fromJson(Map<String, dynamic> json)
      : firstName = json["firstName"],
        lastName = json["lastName"],
        image_url = json["image_url"],
        about = json["about"];

  Map<String, dynamic> toJson() =>
      {"firstName": firstName, "lastName": lastName, "about": about,"image_url": image_url};
}
