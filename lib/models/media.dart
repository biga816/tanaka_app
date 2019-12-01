class Media {
  String mediaType;
  String full;
  String large;
  String medium;
  String thumbnail;

  Media({this.mediaType, this.full, this.large, this.medium, this.thumbnail});

  factory Media.fromMap(Map<String, dynamic> json) {
    Map<String, dynamic> sizes = json["media_details"]["sizes"];
    return Media(
      mediaType: json["media_type"],
      full: sizes["full"] != null ? sizes["full"]["source_url"] : null,
      large: sizes["large"] != null ? sizes["large"]["source_url"] : null,
      medium: sizes["medium"] != null ? sizes["medium"]["source_url"] : null,
      thumbnail:
          sizes["thumbnail"] != null ? sizes["thumbnail"]["source_url"] : null,
    );
  }

  Map<String, dynamic> toMap() => {
        "mediaType": mediaType,
        "full": full,
        "large": large,
        "medium": medium,
        "thumbnail": thumbnail,
      };
}
