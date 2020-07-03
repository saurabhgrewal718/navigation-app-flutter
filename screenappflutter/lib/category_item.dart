import 'package:flutter/material.dart';

import './category_meals_screen.dart';


class CategoryItem extends StatelessWidget {
  final String title;
  final String id; 
  final Color color;

  CategoryItem(this.id,this.title,this.color);
  
  void selectCatagory(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
      '/category_meals',arguments: {
        'id':id,
        'title':title,
      }
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