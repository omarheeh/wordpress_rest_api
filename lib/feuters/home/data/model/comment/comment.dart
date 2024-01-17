import 'author_avatar_urls.dart';
import 'content.dart';
import 'links.dart';

class Comment {
  int? id;
  int? post;
  int? parent;
  int? author;
  String? authorName;
  String? authorUrl;
  String? date;
  String? dateGmt;
  Content? content;
  String? link;
  String? status;
  String? type;
  AuthorAvatarUrls? authorAvatarUrls;
  List<dynamic>? meta;
  Links? links;

  Comment({
    this.id,
    this.post,
    this.parent,
    this.author,
    this.authorName,
    this.authorUrl,
    this.date,
    this.dateGmt,
    this.content,
    this.link,
    this.status,
    this.type,
    this.authorAvatarUrls,
    this.meta,
    this.links,
  });

  factory Comment.fromJsonData(Map<String, dynamic> json) => Comment(
        id: json['id'] as int?,
        post: json['post'] as int?,
        parent: json['parent'] as int?,
        author: json['author'] as int?,
        authorName: json['author_name'] as String?,
        authorUrl: json['author_url'] as String?,
        date: json['date'] as String?,
        dateGmt: json['date_gmt'] as String?,
        content: json['content'] == null
            ? null
            : Content.fromJsonData(json['content'] as Map<String, dynamic>),
        link: json['link'] as String?,
        status: json['status'] as String?,
        type: json['type'] as String?,
        authorAvatarUrls: json['author_avatar_urls'] == null
            ? null
            : AuthorAvatarUrls.fromJsonData(
                json['author_avatar_urls'] as Map<String, dynamic>),
        meta: json['meta'] as List<dynamic>?,
        links: json['_links'] == null
            ? null
            : Links.fromJsonData(json['_links'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJsonData() => {
        'id': id,
        'post': post,
        'parent': parent,
        'author': author,
        'author_name': authorName,
        'author_url': authorUrl,
        'date': date,
        'date_gmt': dateGmt,
        'content': content?.toJsonData(),
        'link': link,
        'status': status,
        'type': type,
        'author_avatar_urls': authorAvatarUrls?.toJsonData(),
        'meta': meta,
        '_links': links?.toJsonData(),
      };
}
