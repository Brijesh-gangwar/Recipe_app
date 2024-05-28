import 'package:dio/dio.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/services/http.service.dart';

class dataservice {
  static dataservice _singleton = dataservice._internal();

  factory dataservice() {
    return _singleton;
  }
  final httpserivce = http_serivce();

  dataservice._internal();

  Future<List<RecipeElement>?> getrecipes(String filter) async {
    var path = 'https://dummyjson.com/recipes';

    if (filter.isNotEmpty) {
      path += '/meal-type/$filter';
    }

    final response = await httpserivce.get(path);
    print(response!.statusCode);
    if (response!.statusCode == 200 && response!.data != null) {
      List data = response.data["recipes"];

      List<RecipeElement> recipes_data =
          data.map((e) => RecipeElement.fromJson(e)).toList();
      print(recipes_data);

      return recipes_data;
    }
  }
}
