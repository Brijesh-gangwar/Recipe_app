import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/services/data_service.dart';

class home_screeen extends StatefulWidget {
  const home_screeen({super.key});

  @override
  State<home_screeen> createState() => _home_screeenState();
}

class _home_screeenState extends State<home_screeen> {
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
    return Container(
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
            child: FilledButton(onPressed: () {}, child: const Text("Snack")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child:
                FilledButton(onPressed: () {}, child: const Text("breakfast")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: FilledButton(onPressed: () {}, child: const Text("lunch")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: FilledButton(onPressed: () {}, child: const Text("dinner")),
          ),
        ],
      ),
    );
  }

  Widget recipe_list() {
    return Expanded(
        child: FutureBuilder(
            future: dataservice().getrecipes(),
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
                  return Card(
                    child: Column(
                      children: [
                        Text(snapshot.data![index].id.toString()),
                        Text(snapshot.data![index].name.toString()),
                        Text(snapshot.data![index].ingredients.toString()),
                      ],
                    ),
                  );
                },
              );
            }));
  }
}
