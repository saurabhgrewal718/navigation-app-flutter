import 'package:flutter/material.dart';

import './category_meals_screen.dart';


class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  CategoryItem(this.title,this.color);
  
  void selectCatagory(BuildContext ctx){
    Navigator.of(ctx).push(MaterialPageRoute(builder:(_){
      return CategoryMealsScreen();
     },
    ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => selectCatagory(context),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
          child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold
          ),
        ),
        decoration: BoxDecoration(gradient: LinearGradient(colors: [
          color.withOpacity(0.7),
          color,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(15),
      ),
  ),
    );
  }
}