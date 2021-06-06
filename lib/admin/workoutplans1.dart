import 'package:flutter/material.dart';
import 'package:login_signin/admin/back1.dart';
import 'package:login_signin/admin/biceps1.dart';
import 'package:login_signin/admin/chest1.dart';
import 'package:login_signin/admin/legs1.dart';
import 'package:login_signin/admin/shoulder1.dart';
import 'package:login_signin/admin/triceps.dart';

class showWorkoutPlans extends StatefulWidget {
  @override
  _showWorkoutPlansState createState() => _showWorkoutPlansState();
}

class _showWorkoutPlansState extends State<showWorkoutPlans> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Exercise Types',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
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
                                    'assets/workoutadmin.jpg',
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
                                                chestHome()));
                                  },
                                  child: Text(
                                    'View',
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
                                    'assets/workoutadmin.jpg',
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
                                                bicepsHome()));
                                  },
                                  child: Text(
                                    'View',
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
                                    'assets/workoutadmin.jpg',
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
                                                tricepsHome()));
                                  },
                                  child: Text(
                                    'View',
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
                                    'assets/workoutadmin.jpg',
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
                                                backHome()));
                                  },
                                  child: Text(
                                    'View',
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
                                    'assets/workoutadmin.jpg',
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
                                                shoulderHome()));
                                  },
                                  child: Text(
                                    'View',
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
                                    'assets/workoutadmin.jpg',
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
                                                legsHome()));
                                  },
                                  child: Text(
                                    'View',
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
