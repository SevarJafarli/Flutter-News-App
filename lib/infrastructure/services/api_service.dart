// import 'dart:convert';

// import 'package:flutter_news/infrastructure/models/article_model.dart';
// import 'package:http/http.dart' as http;

// const _apiKey = 'd41f721e38fb469c97f57333a6023958';

// class CategoryNews {
//   List<ArticleModel> articles = [];

//   Future<void> getNewsByCategory(category) async {
//     var response = await http.get(
//       Uri.parse(
//           'https://newsapi.org/v2/top-headlines?category=$category&apiKey=$_apiKey'),
//     );

//     var jsonData = jsonDecode(response.body);
//     if (jsonData['status'] == 'ok') {
//       print('truee');
//       jsonData['articles'].forEach(
//         (element) {
//           ArticleModel articleModel = ArticleModel(
//             element['author'],
//             element['title'],
//             element['description'],
//             element['url'],
//             element['urlToImage'],
//             element['content'],
//           );
//           articles.add(articleModel);
//         },
//       );
//     }
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_news/infrastructure/models/article_model.dart';

const _apiKey = 'd41f721e38fb469c97f57333a6023958';

class ApiService {
  String url_1 =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=$_apiKey';

  Future<List<ArticleModel>> fetchNews() async {
    http.Response response = await http.get(Uri.parse(url_1));
    if (response.statusCode == 200) {
      print('response is ok');
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];

      List<ArticleModel> articles =
          body.map((dynamic item) => ArticleModel.fromJson(item)).toList();

      return articles;
    } else {
      throw Exception('Cannot get articles');
    }
  }

  Future<List<ArticleModel>> fetchNewsByCategory(category) async {
    http.Response response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$_apiKey'),
    );
    if (response.statusCode == 200) {
      print('response is ok 2');
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<ArticleModel> articlesByCategory =
          body.map((dynamic item) => ArticleModel.fromJson(item)).toList();

      return articlesByCategory;
    } else {
      throw Exception('Cannot get articles');
    }
  }
}
