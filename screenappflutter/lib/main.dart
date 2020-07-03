import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './screens/category_meals_screen.dart';

import './screens/catagories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.black,
      ),
      home: CatagoriesScreen(),
      initialRoute: '/',
      routes: {
        CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen(),
      },
    );
  }
}
