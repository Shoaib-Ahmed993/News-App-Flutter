// import 'package:flutter/foundation.dart';
import 'package:news_app/models/categoryModel.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = <CategoryModel>[];
  CategoryModel categoryModel = new CategoryModel();

  // 1
  categoryModel.categoryName = 'Business';
  categoryModel.imageUrl = 'assets/business.jpg';

  category.add(categoryModel);
  categoryModel = new CategoryModel();

  //2
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageUrl = "assets/entertainment.jpg";
  category.add(categoryModel);

  //3
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imageUrl = "assets/general.jpg";
  category.add(categoryModel);

  //4
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Health";
    categoryModel.imageUrl = 'assets/health.jpg';

  category.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Science";
    categoryModel.imageUrl = 'assets/science.jpg';

  category.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imageUrl = 'assets/sports.jpg';

  category.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.imageUrl = 'assets/technology.jpg';
  category.add(categoryModel);

  return category;
}
