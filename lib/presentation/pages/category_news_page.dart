import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/infrastructure/services/api_service.dart';
import 'package:flutter_news/infrastructure/models/article_model.dart';
import 'package:flutter_news/presentation/widgets/article_list.dart';

class CategoryNewsPage extends StatefulWidget {
  const CategoryNewsPage({Key? key, required this.categoryName})
      : super(key: key);
  final String categoryName;
  @override
  _CategoryNewsPageState createState() => _CategoryNewsPageState();
}

class _CategoryNewsPageState extends State<CategoryNewsPage> {
  List<ArticleModel> articles = [];

  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: FutureBuilder(
        future: apiService.fetchNewsByCategory(
          widget.categoryName,
        ),
        builder: (context, AsyncSnapshot<List<ArticleModel>> snapshot) {
          if (snapshot.hasData) {
            return ArticlesList(articles: snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  // Widget _buildNews() {
  //   return SizedBox(
  //     height: MediaQuery.of(context).size.height,
  //     //  width: MediaQuery.of(context).size.width,
  //     child: ListView.builder(
  //       padding: const EdgeInsets.symmetric(
  //         horizontal: kDefaultPadding,
  //       ),
  //       itemBuilder: (context, index) {
  //         var article = articles[index];
  //         return ArticleTile(
  //           imageUrl: article.urlToImage!,
  //           title: article.title!,
  //           description: article.description!,
  //           url: article.url!,
  //         );
  //       },
  //       itemCount: articles.length,
  //     ),
  //   );
  // }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      leadingWidth: 110.0,
      leading: CupertinoButton(
        // padding: EdgeInsets.zero,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            Text(
              'Back',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
