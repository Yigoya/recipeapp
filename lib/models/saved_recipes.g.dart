// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_recipes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavedRecipesAdapter extends TypeAdapter<SavedRecipes> {
  @override
  final int typeId = 0;

  @override
  SavedRecipes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SavedRecipes(
      recipeId: fields[0] as String,
      recipeCategory: fields[1] as String,
      cookTime: fields[2] as double,
      prepTime: fields[3] as double,
      recipeImage: fields[4] as String,
      recipeName: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SavedRecipes obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.recipeId)
      ..writeByte(1)
      ..write(obj.recipeCategory)
      ..writeByte(2)
      ..write(obj.cookTime)
      ..writeByte(3)
      ..write(obj.prepTime)
      ..writeByte(4)
      ..write(obj.recipeImage)
      ..writeByte(5)
      ..write(obj.recipeName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavedRecipesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
