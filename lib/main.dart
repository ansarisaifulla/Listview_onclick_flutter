import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterui/meal_details.dart';
import 'package:vector_math/vector_math_64.dart' as math;
import 'model/meal.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(MaterialApp(
    title: "flutter demo",
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final heightOfMedia = MediaQuery.of(context).size.height;
    final widthOfMedia = MediaQuery.of(context).size.width;
    final today = DateTime.now();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        child: BottomNavigationBar(
          iconSize: 22,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), title: Text("dashboard")),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text("profile"))
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            height: heightOfMedia * 0.35,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                  bottom: const Radius.circular(30)),
              child: Container(
                padding:
                    EdgeInsets.only(top: 33, left: 17, bottom: 5, right: 15),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text("${DateFormat("EEEE").format(today)},${DateFormat("d MMMM").format(today)} ",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.black)),
                      subtitle: Text(
                        "Hello Saif",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.black87),
                      ),
                      trailing:
                          ClipOval(child: Image(
                            image: AssetImage("assets/saif.jpg"),
                            fit: BoxFit.contain,
                          )),
                    ),
                    Row(
                      children: <Widget>[
                        _RadialProgress(
                            width: widthOfMedia * 0.35,
                            height: widthOfMedia * 0.35,
                        progress:0.7),
                        SizedBox(
                          width: 12.5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start
                                    ,children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0),
                                        child: Text("Protein"),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          LinearPercentIndicator(
                                            width: widthOfMedia*0.37,
                                            animation: true,
                                            progressColor: Colors.blue,
                                            lineHeight: 10,
                                            percent: 0.7,
                                          ),
                                          Text("30 % left",style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w100
                                          ),)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start
                                ,children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left:8.0),
                                    child: Text("Carbs"),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      LinearPercentIndicator(
                                        width: widthOfMedia*0.37,
                                        animation: true,
                                        progressColor: Colors.yellow,
                                        lineHeight: 10,
                                        percent: 0.4,
                                      ),
                                      Text("60 % left",style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w100
                                      ),)
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left:8.0),
                                    child: Text("Fat"),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      LinearPercentIndicator(
                                        width: widthOfMedia*0.38,
                                        animation: true,
                                        progressColor: Colors.red,
                                        lineHeight: 10,
                                        percent: 0.5,
                                      ),
                                      Text("50 % left",style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w100
                                      ),)
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: heightOfMedia * 0.37,
            left: 0,
            right: 0,
            child: Container(
              height: heightOfMedia * 0.55,
              //color: Colors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 25, bottom: 4),
                    child: Text(
                      "Meals",
                      style: TextStyle(fontSize: 19, color: Colors.black87),
                    ),
                  ),
                  Expanded(
                    child: meal_card(),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 15, right: 15, bottom: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          gradient: LinearGradient(
                              colors: [Color(0xFF9CCC65), Color(0xFF558B2F)])),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, bottom: 5),
                            child: Text(
                              "Home Workout",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              "Upper Body",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              IconButton(
                                icon: Image.asset("assets/chest.png"),
                                color: Colors.blue,
                                iconSize: 65,
                              ),
                              IconButton(
                                icon: Image.asset("assets/back.png"),
                                color: Colors.blue,
                                iconSize: 65,
                              ),
                              IconButton(
                                icon: Image.asset("assets/biceps.png"),
                                color: Colors.blue,
                                iconSize: 65,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
class _LinearProgress extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}
class _RadialProgress extends StatelessWidget {
  final double height, width,progress;

  const _RadialProgress({Key key, this.height, this.width,this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomPaint(
      painter: _RadialPaint(progress: 0.7),
      child: Container(
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("30 %",style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 21,
              color: Colors.black87
            ),),
            Text("Left",style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.black54
            ),)
          ],
        ),
      ),
    );
  }
}

class _RadialPaint extends CustomPainter {
  final double progress;

  _RadialPaint({this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint()
      ..strokeWidth = 10
      ..color = Color(0xFF558B2F)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset centre = Offset(size.width / 2, size.height / 2);
   // canvas.drawCircle(centre, size.width / 2, paint);
    double relativeProgress=360*progress;
    canvas.drawArc(Rect.fromCircle(center: centre, radius: size.width / 2),
        math.radians(-90), math.radians(-relativeProgress), false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class meal_card extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: meals.length,
        itemBuilder: (BuildContext context, int index) {
          Meal meal = meals[index];
          return GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MealDetail(meal: meal,)));
            },
            child: Container(
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                      child: Image.asset(meal.imagePath,
                          width: 150, fit: BoxFit.cover),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            height: 5,
                          ),
                          Text(meal.mealTime,
                              style: TextStyle(color: Colors.grey, fontSize: 13)),
                          Text(meal.name,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87)),
                          Text("${meal.kiloCaloriesBurnt} kcal",
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 13)),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.timer,
                                size: 17,
                                color: Colors.grey,
                              ),
                              Text("${meal.timeTaken} min",
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 13)),
                            ],
                          ),
                          SizedBox(height: 5)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
