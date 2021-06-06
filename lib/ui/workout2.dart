import 'package:flutter/material.dart';
import 'package:login_signin/ui/workout_plans.dart';
import 'package:login_signin/ui/workoutplans1.dart';
import 'package:login_signin/ui/workoutplans2.dart';
import 'package:login_signin/ui/workoutplans3.dart';
import 'package:login_signin/ui/workoutplans4.dart';
import 'package:login_signin/ui/workoutplans5.dart';

class workoutNew extends StatefulWidget {
  @override
  _workoutNewState createState() => _workoutNewState();
}

class _workoutNewState extends State<workoutNew> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Exercises',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage('assets/FitnLift-main theme 2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.count(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        primary: false,
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                new Container(
                                  child: new Image.asset(
                                    'assets/chest.jpg',
                                    height: 90.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  'Chest',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: Colors.amber)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                alldata()));
                                  },
                                  child: Text(
                                    'Explore',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  color: Colors.transparent,
                                ),
                              ],
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                new Container(
                                  child: new Image.asset(
                                    'assets/bicep1.jpg',
                                    height: 90.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  'Biceps',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: Colors.amber)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                bicepPlan()));
                                  },
                                  child: Text(
                                    'Explore',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  color: Colors.transparent,
                                ),
                              ],
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                new Container(
                                  child: new Image.asset(
                                    'assets/back1.jpg',
                                    height: 90.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  'Back',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: Colors.amber)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                tricepPlans()));
                                  },
                                  child: Text(
                                    'Explore',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  color: Colors.transparent,
                                ),
                              ],
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                new Container(
                                  child: new Image.asset(
                                    'assets/tricep1.jpg',
                                    height: 90.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  'Triceps',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: Colors.amber)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                backPlans()));
                                  },
                                  child: Text(
                                    'Explore',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  color: Colors.transparent,
                                ),
                              ],
                            ),
                          ),
                          Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                new Container(
                                  child: new Image.asset(
                                    'assets/shoulder2.jpg',
                                    height: 90.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  'Shoulder',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: Colors.amber)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                shoulderPlans()));
                                  },
                                  child: Text(
                                    'Explore',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  color: Colors.transparent,
                                ),
                              ],
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                new Container(
                                  child: new Image.asset(
                                    'assets/leg2.jpg',
                                    height: 90.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  'Legs',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(color: Colors.amber)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                legPlans()));
                                  },
                                  child: Text(
                                    'Explore',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  color: Colors.transparent,
                                ),
                              ],
                            ),
                          ),
                        ],
                        crossAxisCount: 2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
