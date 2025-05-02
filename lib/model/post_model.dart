class Post {
  String? name;
  String? recipe;
  String? tayyorlash;
  String? about;
  String? image_url;
  String? id;

  Post({
    this.name,
    this.recipe,
    this.about,
    this.tayyorlash,
    this.image_url,
    this.id,
  });

  Post.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        recipe = json["recipe"],
        tayyorlash = json["tayyorlash"],
        image_url = json["image_url"],
        about = json["about"],
        id = json["id"];

  Map<String, dynamic> toJson() => {
        "name": name,
        "recipe": recipe,
        "tayyorlash": tayyorlash,
        "about": about,
        "image_url": image_url,
        "id": id
      };
}
