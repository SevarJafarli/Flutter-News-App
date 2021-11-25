import 'package:flutter/material.dart';
import 'package:flutter_news/infrastructure/helpers/category_data.dart';
import 'package:flutter_news/infrastructure/services/api_service.dart';
import 'package:flutter_news/infrastructure/models/article_model.dart';
import 'package:flutter_news/infrastructure/models/category_model.dart';
import 'package:flutter_news/presentation/widgets/article_list.dart';
import 'package:flutter_news/presentation/widgets/category_tile.dart';
import 'package:flutter_news/utilities/theme_globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  // List<ArticleModel> articles = [];

  ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() => AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: RichText(
          text: const TextSpan(
            text: 'Flutter',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: 'News',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildCategories(),
          FutureBuilder(
            future: apiService.fetchNews(),
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
        ],
      ),
    );
  }

  SizedBox _buildCategories() {
    return SizedBox(
      height: 55.0,
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding / 2,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoryTile(categoryName: categories[index].categoryName);
        },
      ),
    );
  }
}
