import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:recipe_app/models/saved_recipes.dart';

class SavedProvider with ChangeNotifier {
  late Box<SavedRecipes> _savedRecipesBox;

  SavedProvider() {
    _savedRecipesBox = Hive.box<SavedRecipes>('savedRecipesBox');
  }

  Map<String, SavedRecipes> get getSaved {
    return Map.fromEntries(_savedRecipesBox.values
        .map((recipe) => MapEntry(recipe.recipeId, recipe)));
  }

  void addAndRemoveFromSaved(String recipeId, String recipeCategory,
      double cookTime, double prepTime, String recipeImage, String recipeName) {
    if (_savedRecipesBox.containsKey(recipeId)) {
      removeRecipe(recipeId);
    } else {
      _savedRecipesBox.put(
          recipeId,
          SavedRecipes(
              recipeId: recipeId,
              recipeCategory: recipeCategory,
              cookTime: cookTime,
              prepTime: prepTime,
              recipeImage: recipeImage,
              recipeName: recipeName));
    }
    notifyListeners();
  }

  void clearRecipes() {
    _savedRecipesBox.clear();
    notifyListeners();
  }

  void removeRecipe(String recipeId) {
    _savedRecipesBox.delete(recipeId);
    notifyListeners();
  }
}
