import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/recipe.dart';

class RecipeProvider extends ChangeNotifier {
  List<Recipe> _recipes = [];
  bool _isLoading = false;

  List<Recipe> get recipes => _recipes;
  bool get isLoading => _isLoading;

  Future<void> fetchRecipes() async {
    _isLoading = true;
    notifyListeners();

    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list', {
      "limit": "22",
      "start": "0",
      "tag": "list.recipe.popular",
    });

    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': '265d932c77msha378875aaf13249p165bf2jsnd59703aaf21f',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
    });

    // if (response.statusCode == 200) {
    Map data = jsonDecode(response.body);
    List<Map<String, dynamic>> temp = [];

    for (var i in data['feed']) {
      temp.add(i['content']['details']);
    }

    _recipes = Recipe.recipesFromSnapshot(temp);
    // }

    _isLoading = false;
    notifyListeners();
  }
}
