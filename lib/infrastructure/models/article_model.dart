class ArticleModel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;

  ArticleModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      author: (json['author'] as String?) ?? '',
      title: (json['title'] as String?) ?? '',
      description: (json['description'] as String?) ?? '',
      url: (json['url'] as String?) ?? '',
      urlToImage: (json['urlToImage'] as String?) ?? '',
    );
  }
}
