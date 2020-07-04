import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal_detail';
  @override
  Widget build(BuildContext context) {

    //recieving the argumnets here which were being srnt by the previous screen
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,String> ;
    final mealId = routeArgs['id'];
    final pageTitle = routeArgs['title'];
    //image url we got fro previous screen now we will try to use the image url we get by matching ids from the dummy data file
    final imageUrl = routeArgs['imageUrl'];
    //recieving args ends here
    //using the data from the dummy file
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(title:Text('$pageTitle')),
      body: Column(
        children: <Widget>[
          //using the data passed from previous screen 

          //Container(height: 300,width: double.infinity,child: Image.network(imageUrl),),
          
          //but since we re receving the id in this screen and have the data file too in the application so we can directly 
          //filter out the image by matching the ids with each other 
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(selectedMeal.imageUrl,fit: BoxFit.cover,),
          ),
          Text(mealId,style: TextStyle(),),
          Container(
            margin: EdgeInsets.symmetric(vertical:10),
            width: 400,
            height: 200,
            child: ListView.builder(
              itemBuilder: (ctx,index) => Card(
                color: Theme.of(context).accentColor,
                child : Text(selectedMeal.ingredients[index]),
              ),
              itemCount: selectedMeal.ingredients.length,),
          ),
        ],
      )
    );
  }
}