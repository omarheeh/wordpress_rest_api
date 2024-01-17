class Collection {
  String? href;

  Collection({this.href});

  factory Collection.fromJsonData(Map<String, dynamic> json) => Collection(
        href: json['href'] as String?,
      );

  Map<String, dynamic> toJsonData() => {
        'href': href,
      };
}
