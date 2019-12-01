import './media.dart';

class Work {
  int id;
  String date;
  String title;
  String content;
  Media media;
  String link;

  Work({this.id, this.date, this.title, this.content, this.media, this.link});

  factory Work.fromMap(Map<String, dynamic> json) => Work(
        id: json["id"],
        date: json["date"],
        title: json["title"]["rendered"],
        content: json["data"]["description"],
        media: Media.fromMap(json["_embedded"]["wp:featuredmedia"][0]),
        link: json["data"]["link"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "date": date,
        "title": title,
        "content": content,
        "media": media,
      };
}
