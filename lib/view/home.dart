// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_22_recipeapp_provider/providers/recipe_provider.dart';
// import '../models/recipe.dart';
// import '../models/recipe.api.dart';
import 'widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title:
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.restaurant_menu),
        SizedBox(width: 10),
        Text('Food Recipes'),
      ])),
      body: recipeProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: recipeProvider.recipes.length,
              itemBuilder: (context, index) => RecipeCard(
                  title: recipeProvider.recipes[index].name,
                  cookTime: recipeProvider.recipes[index].totalTime,
                  rating: recipeProvider.recipes[index].rating.toString(),
                  thumbnailUrl: recipeProvider.recipes[index].images)),
    );
  }
}
//       body: const RecipeCard(
//         title: 'My recipe',
//         rating: '4.9',
//         cookTime: '30 min',
//         thumbnailUrl:
//             'https://lh3.googleusercontent.com/ei5eF1LRFkkcekhjdR_8XgOqgdjpomf-rda_vvh7jIauCgLlEWORINSKMRR6I6iTcxxZL9riJwFqKMvK0ixS0xwnRHGMY4I5Zw=s360',
//       ),
//     );
//   }
// }
