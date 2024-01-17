class Content {
  String? rendered;

  Content({this.rendered});

  factory Content.fromJsonData(Map<String, dynamic> json) => Content(
        rendered: json['rendered'] as String?,
      );

  Map<String, dynamic> toJsonData() => {
        'rendered': rendered,
      };
}
