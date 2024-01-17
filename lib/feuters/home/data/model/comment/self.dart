class Self {
  String? href;

  Self({this.href});

  factory Self.fromJsonData(Map<String, dynamic> json) => Self(
        href: json['href'] as String?,
      );

  Map<String, dynamic> toJsonData() => {
        'href': href,
      };
}
