import 'package:flutter/material.dart';
import 'package:login_signin/admin/addmealdetails.dart';
import 'package:login_signin/admin/updatemealdetails.dart';
import 'package:login_signin/admin/viewmeal.dart';

class mealInfo extends StatefulWidget {
  @override
  _mealInfoState createState() => _mealInfoState();
}

class _mealInfoState extends State<mealInfo> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Breakfast Meal Information',
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
                        mainAxisSpacing: 30,
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
                                    'assets/mealadmin.jpg',
                                    height: 90.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  'View Meals',
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
                                                viewMeal()));
                                  },
                                  child: Text(
                                    'Click',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  color: Colors.transparent,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                new Container(
                                  child: new Image.asset(
                                    'assets/mealadmin.jpg',
                                    height: 90.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  'Add Meals',
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
                                                addBreakfast()));
                                  },
                                  child: Text(
                                    'Click',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  color: Colors.transparent,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                new Container(
                                  child: new Image.asset(
                                    'assets/mealadmin.jpg',
                                    height: 90.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  'Update Meals',
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
                                                updateBreakfast()));
                                  },
                                  child: Text(
                                    'Click',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
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
