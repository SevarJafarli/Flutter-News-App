import 'package:flutter_news/infrastructure/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = [
    CategoryModel('Business'),
    CategoryModel('Entertainment'),
    CategoryModel('General'),
    CategoryModel('Health'),
    CategoryModel('Science'),
    CategoryModel('Sports'),
    CategoryModel('Technology'),
  ];

  return categories;
}
