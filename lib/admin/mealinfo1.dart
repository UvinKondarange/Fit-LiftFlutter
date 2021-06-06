import 'package:flutter/material.dart';
import 'package:login_signin/admin/mealinfo.dart';
import 'package:login_signin/admin/mealinfodinner.dart';
import 'package:login_signin/admin/mealinfolunch.dart';

class mealInfo1 extends StatefulWidget {
  @override
  _mealInfo1State createState() => _mealInfo1State();
}

class _mealInfo1State extends State<mealInfo1> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Meal Types',
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
                                  'Breakfast Meals',
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
                                                mealInfo()));
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
                                  'Lunch Meals',
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
                                                mealInfoLunch()));
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
                                  'Dinner Meals',
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
                                                mealInfoDinner()));
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
