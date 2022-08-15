class ArticleModel{

  String title='';
  String description='';
  String url='';
  String urlToImage='';

  ArticleModel({required this.title, required this.description, required this.url, required this.urlToImage});
  ArticleModel.empty();

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json["title"] ?? '',
      description: json["description"] ?? '',
      url: json["url"] ?? '',
      urlToImage: json["urlToImage"] ?? '',
    );
  }

}