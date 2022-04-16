import 'package:carrot_market/recipe_detail.dart';
import 'package:flutter/material.dart';
import 'recipe.dart';

void main() {
  runApp(const RecipesApp());
}


class RecipesApp extends StatelessWidget {
  const RecipesApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is the Recipies App'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: (){
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context){
                  return RecipeDetail(recipe: recipes[index],);
                }));
              },
              child: buildRecipeCard(recipes[index])
          );
        },
        itemCount: recipes.length,
      ),
    );
  }

  Widget buildRecipeCard(Recipe recipe){
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(recipe.imageURL),
            const SizedBox(height: 12),
            Text(
              recipe.label,
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, fontFamily: 'Palatino'),
            )
          ],
        ),
      ),
    );
  }
}
