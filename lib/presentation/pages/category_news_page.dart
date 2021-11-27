import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/infrastructure/providers/connectivity_provider.dart';
import 'package:flutter_news/infrastructure/services/api_service.dart';
import 'package:flutter_news/infrastructure/models/article_model.dart';
import 'package:flutter_news/presentation/widgets/article_list.dart';
import 'package:flutter_news/presentation/widgets/no_internet_connection.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

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

  FutureBuilder<List<ArticleModel>> _buildBody() {
    return FutureBuilder(
      future: apiService.fetchNewsByCategory(
        widget.categoryName,
      ),
      builder: (context, AsyncSnapshot<List<ArticleModel>> snapshot) {
        if (snapshot.hasData) {
          return ArticlesList(
              refreshPage: _refreshPage, articles: snapshot.data!);
        } else if (snapshot.hasError) {
          return const Center(child: NoInternetConnection());
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
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
    await Future.delayed(
      const Duration(milliseconds: 500),
    );
    setState(() {
      apiService.fetchNewsByCategory(widget.categoryName);
    });
    print('category news page refreshed');
  }
}
