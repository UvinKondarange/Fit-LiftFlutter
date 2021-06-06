import 'package:flutter/material.dart';
import 'package:login_signin/bmi/BMICalculatorScreen.dart';
import 'package:login_signin/icon/drawer.dart';
import 'package:login_signin/ui/meal2.dart';
import 'package:login_signin/ui/workout2.dart';

class updatedHome extends StatefulWidget {
  @override
  _updatedHomeState createState() => _updatedHomeState();
}

class _updatedHomeState extends State<updatedHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Fit&Lift',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      drawer: mainDrawer(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/FitnLift-03.jpg'),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/workout2.jpg'),
                  fit: BoxFit.cover,
                )),
                padding: EdgeInsets.all(60.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Workout Plans',
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(color: Colors.amber)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      workoutNew()));
                        },
                        child: Text(
                          'Explore',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        color: Colors.transparent,
                      ),
                    ],
                  ),
                )),
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/meal1.jpg'),
                  fit: BoxFit.cover,
                )),
                padding: EdgeInsets.all(60.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Meal Plans',
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(color: Colors.amber)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      mealNew()));
                        },
                        child: Text('Explore',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        color: Colors.transparent,
                      ),
                    ],
                  ),
                )),
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/bmi1new.jpg'),
                  fit: BoxFit.cover,
                )),
                padding: EdgeInsets.all(60.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('BMI',
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(color: Colors.amber)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      BMICalculatorScreen()));
                        },
                        child: Text('Calculate',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        color: Colors.transparent,
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
