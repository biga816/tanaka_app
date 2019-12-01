import './media.dart';

class Tag {
  int id;
  String link;
  String name;
  String slug;

  Tag({this.id, this.link, this.name, this.slug});

  factory Tag.fromMap(Map<String, dynamic> json) => Tag(
        id: json["id"],
        link: json["link"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "link": link,
        "name": name,
        "slug": slug,
      };
}

class Post {
  int id;
  String date;
  String title;
  String content;
  Media media;
  List<Tag> tags;

  Post({this.id, this.date, this.title, this.content, this.media, this.tags});

  factory Post.fromMap(Map<String, dynamic> json) => Post(
      id: json["id"],
      date: json["date"],
      title: json["title"]["rendered"],
      content: json["content"]["rendered"],
      media: Media.fromMap(json["_embedded"]["wp:featuredmedia"][0]),
      tags: json["_embedded"]["wp:term"]
          .map<Tag>((tag) => Tag.fromMap(tag[0]))
          .toList());

  Map<String, dynamic> toMap() => {
        "id": id,
        "date": date,
        "title": title,
        "content": content,
        "media": media,
        "tags": tags,
      };
}
