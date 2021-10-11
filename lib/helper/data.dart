import 'package:flutter/foundation.dart';
import 'package:news_app/models/categoryModel.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = <CategoryModel>[];
  CategoryModel categoryModel = new CategoryModel();

  // 1
  categoryModel.categoryName = 'Business';
  categoryModel.imageUrl =
      'https://media.istockphoto.com/photos/cheerful-woman-and-her-business-plan-picture-id1282110628?b=1&k=20&m=1282110628&s=170667a&w=0&h=NDDPlHUlIblxtIa6J0NIv81PGbG-G6GMPTirGuKEV7I=';

  category.add(categoryModel);
  categoryModel = new CategoryModel();

  //2
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageUrl =
      "https://media.istockphoto.com/photos/the-musicians-were-playing-rock-music-on-stage-there-was-an-audience-picture-id1319479588?b=1&k=20&m=1319479588&s=170667a&w=0&h=bunblYyTDA_vnXu-nY4x4oa7ke6aiiZKntZ5mfr-4aM=";
  category.add(categoryModel);

  //3
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";

  category.add(categoryModel);

  //4
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";

  category.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.imageUrl =
      'https://media.istockphoto.com/photos/high-school-girl-looking-through-microscope-at-school-picture-id1278973856?b=1&k=20&m=1278973856&s=170667a&w=0&h=kgZqSU0MWljS9b0BUzD9zsW2-7vHS8RlFdI_J8xW-Bo=';

  category.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imageUrl =
      'https://media.istockphoto.com/photos/various-sport-equipments-on-grass-picture-id949190736?b=1&k=20&m=949190736&s=170667a&w=0&h=f3ofVqhbmg2XSVOa3dqmvGtHc4VLA_rtbboRGaC8eNo=';

  category.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.imageUrl =
      'https://media.istockphoto.com/photos/technician-works-on-a-laptop-in-big-data-center-full-of-rack-servers-picture-id802301300?b=1&k=20&m=802301300&s=170667a&w=0&h=r_I-cFP0CFD71RGIeqVk0E-QldENrB0R9nGqmXjgo_A=';
  category.add(categoryModel);

  return category;
}
