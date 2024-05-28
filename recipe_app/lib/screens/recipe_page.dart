import 'dart:ffi';

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
        body: recipe_view(context));
  }
}

Widget recipe_view(BuildContext context) {
  return Column(children: [
    recipe_image(
      context,
    ),
    recipe_details(
      context,
    ),
  ]);
}

Widget recipe_image(BuildContext context) {
  return Container(
      height: MediaQuery.sizeOf(context).height * 0.4,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(""),
        ),
      ));
}

Widget recipe_details(BuildContext context) {
  return Column(
    children: [Text("")],
  );
}
