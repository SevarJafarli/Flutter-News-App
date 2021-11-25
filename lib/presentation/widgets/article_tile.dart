import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/presentation/pages/article_page.dart';
import 'package:flutter_news/utilities/theme_globals.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.url,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final String description;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kDefaultPadding,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ArticlePage(
                  url: url,
                ),
              ),
            ),
            //todo
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: kDefaultPadding / 2,
          ),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: kDefaultPadding / 4,
          ),
          Text(
            description,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
