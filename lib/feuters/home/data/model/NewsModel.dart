class NewsModel {
  final String id;
  final String? date;
  final String? title;
  final String? content;
  final List<int>? categores;
  final String? featuredImageUrl;
  final String? categoreName;
  final int? commentsCount;
  NewsModel({
    required this.id,
    required this.date,
    required this.title,
    required this.content,
    required this.categores,
    required this.featuredImageUrl,
    required this.categoreName,
    required this.commentsCount,
  });

  factory NewsModel.fromJsonData(Map<String, dynamic> jsonData) {
    return NewsModel(
      id: jsonData['id'].toString(),
      date: jsonData['date'],
      title: jsonData['custom_meta_key'],
      content: jsonData['big_content'],
      categores: jsonData['categories'].cast<int>().toList(),
      featuredImageUrl: jsonData['featured_image_url'],
      categoreName: jsonData['_embedded']['wp:term'][0][0]['name'],
      commentsCount: getCommentCount(jsonData),
    );
  }
}

int? getCommentCount(Map<String, dynamic> jsonData) {
  try {
    return jsonData['_embedded']['replies'][0].length;
  } catch (e) {
    return 0;
  }
}
