class UserModel {
  String? token;
  String? userEmail;
  String? userNicename;
  String? userDisplayName;

  UserModel({
    this.token,
    this.userEmail,
    this.userNicename,
    this.userDisplayName,
  });

  factory UserModel.fromJsonData(Map<String, dynamic> json) => UserModel(
        token: json['token'] as String?,
        userEmail: json['user_email'] as String?,
        userNicename: json['user_nicename'] as String?,
        userDisplayName: json['user_display_name'] as String?,
      );

  Map<String, dynamic> toJsonData() => {
        'token': token,
        'user_email': userEmail,
        'user_nicename': userNicename,
        'user_display_name': userDisplayName,
      };
}
