import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/infrastructure/services/api_service.dart';
import 'package:flutter_news/infrastructure/models/article_model.dart';
import 'package:flutter_news/presentation/widgets/article_list.dart';
import 'package:get/route_manager.dart';

class CategoryNewsPage extends StatefulWidget {
  const CategoryNewsPage({Key? key, required this.categoryName})
      : super(key: key);
  final String categoryName;
  @override
  _CategoryNewsPageState createState() => _CategoryNewsPageState();
}

class _CategoryNewsPageState extends State<CategoryNewsPage> {
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
            return ArticlesList(
                refreshPage: _refreshPage, articles: snapshot.data!);
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

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leadingWidth: 110.0,
      leading: CupertinoButton(
        // padding: EdgeInsets.zero,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).iconTheme.color,
            ),
            Text(
              'Back',
              style: TextStyle(
                color: Theme.of(context).iconTheme.color,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        onPressed: () => Get.back(),
      ),
    );
  }

  Future<void> _refreshPage() async {
    setState(() {
      apiService.fetchNewsByCategory(widget.categoryName);
    });
    print('category news page refreshed');
  }
}
