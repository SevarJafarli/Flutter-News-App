import 'package:flutter/material.dart';
import 'package:flutter_news/infrastructure/models/article_model.dart';
import 'package:flutter_news/presentation/widgets/article_tile.dart';
import 'package:flutter_news/utilities/theme_globals.dart';

class ArticlesList extends StatelessWidget {
  const ArticlesList({
    Key? key,
    required this.articles,
  }) : super(key: key);

  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: kDefaultPadding,
      ),
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
        ),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          ArticleModel? article = articles[index];
          return ArticleTile(
            imageUrl: article.urlToImage ?? '',
            title: article.title ?? '',
            description: article.description ?? '',
            url: article.url ?? '',
          );
        },
        itemCount: articles.length,
      ),
    );
  }
}
