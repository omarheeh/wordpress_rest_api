class Up {
  bool? embeddable;
  String? postType;
  String? href;

  Up({this.embeddable, this.postType, this.href});

  factory Up.fromJsonData(Map<String, dynamic> json) => Up(
        embeddable: json['embeddable'] as bool?,
        postType: json['post_type'] as String?,
        href: json['href'] as String?,
      );

  Map<String, dynamic> toJsonData() => {
        'embeddable': embeddable,
        'post_type': postType,
        'href': href,
      };
}
