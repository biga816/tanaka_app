class Profile {
  int id;
  String name;
  String description;
  String link;

  Profile({this.id, this.name, this.description, this.link});

  factory Profile.fromMap(Map<String, dynamic> json) => Profile(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      link: json["link"]);

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "link": link,
      };
}
