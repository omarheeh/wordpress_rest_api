class AuthorAvatarUrls {
  String? avatar1;
  String? avatar2;
  String? avatar3;

  AuthorAvatarUrls({this.avatar1, this.avatar2, this.avatar3});

  factory AuthorAvatarUrls.fromJsonData(Map<String, dynamic> json) {
    return AuthorAvatarUrls(
      avatar1: json['24'] as String?,
      avatar2: json['48'] as String?,
      avatar3: json['96'] as String?,
    );
  }

  Map<String, dynamic> toJsonData() => {
        '24': 24,
        '48': 48,
        '96': 96,
      };
}
