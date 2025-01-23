import 'package:hive/hive.dart';

part 'saved_recipes.g.dart';

@HiveType(typeId: 0)
class SavedRecipes extends HiveObject {
  @HiveField(0)
  final String recipeId;

  @HiveField(1)
  final String recipeCategory;

  @HiveField(2)
  final double cookTime;

  @HiveField(3)
  final double prepTime;

  @HiveField(4)
  final String recipeImage;

  @HiveField(5)
  final String recipeName;

  SavedRecipes({
    required this.recipeId,
    required this.recipeCategory,
    required this.cookTime,
    required this.prepTime,
    required this.recipeImage,
    required this.recipeName,
  });
}
