import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_news/infrastructure/helpers/category_data.dart';
import 'package:flutter_news/infrastructure/providers/connectivity_provider.dart';
import 'package:flutter_news/infrastructure/services/api_service.dart';
import 'package:flutter_news/infrastructure/models/article_model.dart';
import 'package:flutter_news/infrastructure/services/theme_service.dart';
import 'package:flutter_news/presentation/widgets/article_list.dart';
import 'package:flutter_news/presentation/widgets/category_tile.dart';
import 'package:flutter_news/presentation/widgets/no_internet_connection.dart';
import 'package:flutter_news/utilities/theme_globals.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService apiService = ApiService();
  @override
  void initState() {
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        body: Consumer<ConnectivityProvider>(
            builder: (consumerContext, model, child) {
          return model.isOnline ? _buildBody() : const NoInternetConnection();
        }));
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) => AppBar(
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            text: 'Flutter',
            style: TextStyle(
              color: Theme.of(context).appBarTheme.titleTextStyle?.color,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            children: const [
              TextSpan(
                text: ' News',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: kDefaultPadding),
            child: GestureDetector(
              child: const Icon(
                Icons.dark_mode,
                size: 30.0,
              ),
              onTap: () {
                ThemeService().changeThemeMode();
                print('Changed');
              },
            ),
          ),
        ],
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
                return Container(
                  // color: Colors.red,
                  padding: const EdgeInsets.symmetric(
                    vertical: kDefaultPadding,
                  ),
                  height: MediaQuery.of(context).size.height,
                  child: ArticlesList(
                      refreshPage: _refreshPage, articles: snapshot.data!),
                );
              } else if (snapshot.hasError) {
                return Center(child: const NoInternetConnection());
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

  Future<void> _refreshPage() async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );
    setState(() {
      apiService.fetchNews();
    });
    print('home page refreshed');
  }

  Container _buildCategories() {
    var categories = getCategories();
    return Container(
      height: 55.0,
      margin: const EdgeInsets.only(
        top: kDefaultPadding / 2,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding / 2,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoryTile(
            categoryName: categories[index].categoryName,
          );
        },
      ),
    );
  }
}
