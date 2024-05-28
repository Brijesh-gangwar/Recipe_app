

import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';

class recipe_page extends StatelessWidget {
  final RecipeElement recipe;
  const recipe_page({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(recipe.name),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(recipe.image),
                    ),
                  )),

              //displaying details
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${recipe.cuisine}, ${recipe.difficulty.name}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      recipe.name,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Prep Time : ${recipe.prepTimeMinutes} minutes | Cook Time : ${recipe.cookTimeMinutes} minutes ",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      "${recipe.rating}⭐ | ${recipe.reviewCount} Reviews",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      child: Column(
                        children: recipe.ingredients.map((i) {
                          return Row(
                            children: [
                              Icon(Icons.check_box),
                              Text(" $i"),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: recipe.instructions.map((e) {
                          return Text(
                            "${recipe.instructions.indexOf(e)} $e\n",
                            maxLines: 3,
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 15),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
