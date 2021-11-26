import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/presentation/pages/category_news_page.dart';
import 'package:flutter_news/utilities/theme_globals.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CategoryNewsPage(
            categoryName: categoryName,
          ),
        ),
      ),
      child: Container(
        // height: 50.0,
        margin: const EdgeInsets.only(
          left: kDefaultPadding / 2,
        ),
        width: 150.0,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        child: Center(
          child: Text(
            categoryName,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).appBarTheme.titleTextStyle?.color,
            ),
          ),
        ),
      ),
    );
  }
}
