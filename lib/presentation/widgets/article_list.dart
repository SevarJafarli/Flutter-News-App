import 'package:flutter/material.dart';
import 'package:flutter_news/infrastructure/models/article_model.dart';
import 'package:flutter_news/presentation/widgets/article_tile.dart';
import 'package:flutter_news/presentation/widgets/refresh_widget.dart';
import 'package:flutter_news/utilities/theme_globals.dart';

class ArticlesList extends StatelessWidget {
  const ArticlesList({
    Key? key,
    required this.articles,
    required this.refreshPage,
  }) : super(key: key);

  final Future<void> Function() refreshPage;
  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return RefreshWidget(
      onRefresh: refreshPage,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
        ),
        shrinkWrap: true,
        primary: false,
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
