import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/models/saved_recipes.dart';
import 'package:recipe_app/models/user_model.dart';
import 'package:recipe_app/provider/provider.dart';
import 'package:recipe_app/custom_theme.dart';
import 'package:recipe_app/provider/user_provider.dart';
import 'package:recipe_app/screens/sign_in_page.dart';
import 'package:sizer/sizer.dart';

import 'custom_navbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(SavedRecipesAdapter());
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<SavedRecipes>('savedRecipesBox');
  await Hive.openBox<User>('usersBox');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ListOfRecipes()),
        ChangeNotifierProvider(create: (_) => SavedProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Recipe App',
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.lightTheme,
        home: SignInPage(),
      );
    });
  }
}
