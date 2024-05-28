import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/screens/recipe_page.dart';
import 'package:recipe_app/services/data_service.dart';

class home_screeen extends StatefulWidget {
  const home_screeen({super.key});

  @override
  State<home_screeen> createState() => _home_screeenState();
}

class _home_screeenState extends State<home_screeen> {
  String mealtype_filter = "";
  List<String> chips_data = [];

  final chips_meal_type = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("homepage")),
      body: SafeArea(
        child: build_ui(),
      ),
    );
  }

  Widget build_ui() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          recipe_type_buttons(),
          recipe_list(),
        ],
      ),
    );
  }

  Widget recipe_type_buttons() {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.05,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: FilledButton(
                onPressed: () {
                  setState(() {
                    mealtype_filter = "";
                  });
                },
                child: const Text("All")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: FilledButton(
              onPressed: () {
                setState(() {
                  mealtype_filter = "Snacks";
                });
              },
              child: const Text("Snacks"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: FilledButton(
                onPressed: () {
                  setState(() {
                    mealtype_filter = "Breakfast";
                  });
                },
                child: const Text("Breakfast")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: FilledButton(
                onPressed: () {
                  setState(() {
                    mealtype_filter = "Lunch";
                  });
                },
                child: const Text("Lunch")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: FilledButton(
                onPressed: () {
                  setState(() {
                    mealtype_filter = "Dinner";
                  });
                },
                child: const Text("Dinner")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: FilledButton(
                onPressed: () {
                  setState(() {
                    mealtype_filter = "Beverage";
                  });
                },
                child: const Text("Beverage")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: FilledButton(
                onPressed: () {
                  setState(() {
                    mealtype_filter = "Side Dish";
                  });
                },
                child: const Text("Side Dish")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: FilledButton(
                onPressed: () {
                  setState(() {
                    mealtype_filter = "Dessert";
                  });
                },
                child: const Text("Dessert")),
          ),
        ],
      ),
    );
  }

  Widget recipe_list() {
    return Expanded(
        child: FutureBuilder(
            future: dataservice().getrecipes(mealtype_filter),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                print(snapshot.error);
              }
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  RecipeElement recipe = snapshot.data![index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return recipe_page(
                              recipe: recipe,
                            );
                          },
                        ));
                      },
                      subtitle: Text(
                          "${recipe.cuisine}\n Difficulty: ${recipe.difficulty}"),
                      title: Text(recipe.name),
                      leading: Image.network(recipe.image),
                      trailing: Text("${recipe.rating.toString()} *"),
                    ),
                  );
                },
              );
            }));
  }
}
