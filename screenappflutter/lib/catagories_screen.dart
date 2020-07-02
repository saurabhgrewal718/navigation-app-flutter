import 'package:flutter/material.dart';
import 'package:screenappflutter/category_item.dart';
import './dummy_data.dart';

class CatagoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      children: DUMMY_CATEGORIES
      .map((catData) => CategoryItem(
        catData.title, 
        catData.color
       ),
      ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,childAspectRatio: 3/2,crossAxisSpacing: 20,mainAxisSpacing: 20),
    );
  }
}