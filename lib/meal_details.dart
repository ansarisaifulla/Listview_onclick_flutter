import 'package:flutter/material.dart';
import 'main.dart';
import 'model/meal.dart';

class MealDetail extends StatelessWidget {
  final Meal meal;

  const MealDetail({Key key, this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
           children: <Widget>[
             Container(
               width: MediaQuery.of(context).size.width,
                 height: MediaQuery.of(context).size.width - 70,
                 decoration: BoxDecoration(
                     borderRadius:
                     BorderRadius.vertical(bottom: Radius.circular(30)),
                     boxShadow: [
                       BoxShadow(
                           offset: Offset(0, 2),
                           color: Colors.black54,
                           blurRadius: 6)
                     ]),
                 child: ClipRRect(
                   borderRadius:
                   BorderRadius.vertical(bottom: Radius.circular(30)),
                   child: Image(
                     image: AssetImage(meal.imagePath),
                     fit: BoxFit.cover,
                   ),
                 )),
             Positioned(
               top: 0,
               left: 0,
               child: IconButton(
                 icon: Icon(Icons.arrow_back),
                 iconSize: 25,
                 color: Colors.black,
                 onPressed: () {
                   Navigator.pop(context);
                 },
               ),
             ),
           ],
          ),
          SizedBox(height: 8),
          ListTile(
            title: Text(meal.mealTime,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black)),
            subtitle: Text(
              meal.name,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87),
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
//                    SizedBox(
//                      width: 30,
//                    ),
                    Text(
                      "${meal.kiloCaloriesBurnt} kcal",
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.access_time,
                      color: Colors.grey,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${meal.timeTaken} mins",
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 14),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 8,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "INGREDIENTS :",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 15,
                color: Colors.blueGrey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
               Text(meal.ingredients[0]),
                Text(meal.ingredients[1]),
                Text(meal.ingredients[2]),
                Text(meal.ingredients[3]),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "PREPARATION :",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 15,
                color: Colors.blueGrey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16,right: 16,bottom: 20),
            child: Text(
              meal.preparation,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
