import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal_detail';
  
  Widget buildSelectionTitle(BuildContext context,String text){
    return Container(
      margin:EdgeInsets.symmetric(vertical:10),
      child: Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget buildContainer(Widget child){
    return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color:Colors.grey),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              width: 350,
              height: 200,
              child: child,
            );
  }

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
      body: SingleChildScrollView(
        child:Column(
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
          buildSelectionTitle(context,mealId),
          buildContainer(
            ListView.builder(
                itemBuilder: (ctx,index) => Card(
                  color: Theme.of(context).accentColor,
                  child : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,)
            ),
            buildSelectionTitle(context,'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx,index) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(child: Text('${(index + 1)}'),),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
        ],
      )
      )
    );
  }
}