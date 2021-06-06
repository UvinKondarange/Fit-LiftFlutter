import 'package:flutter/material.dart';
import 'package:login_signin/map/loadmap.dart';
import 'package:login_signin/net/chatbot.dart';
import 'package:login_signin/ui/authentication.dart';
import 'package:login_signin/ui/gymview.dart';
import 'package:login_signin/ui/profile.dart';
import 'package:login_signin/ui/updatedhome.dart';

class mainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {  
    return Drawer(
      child: Container(
        color: Colors.amber,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Colors.black54,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(top:30),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage
                        ('assets/FitnLift-04.png'), fit: BoxFit.cover, 
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              tileColor: Colors.amber,
              leading: Icon(Icons.home, color: Colors.black,),
          
              title: Text('Home', style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),),
              onTap: (){
                Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => updatedHome()));
              },
            ),
             ListTile(
              tileColor: Colors.amber,
              leading: Icon(Icons.location_on_outlined, color: Colors.black,),
              title: Text('Near Me', style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),),
              onTap: (){
                Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => loadMap()));
              },
            ),
             ListTile(
              tileColor: Colors.amber,
              leading: Icon(Icons.wallet_membership, color: Colors.black,),
              title: Text('Gyms', style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),),
              onTap: (){
                Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => gymView()));
              },
            ),
             ListTile(
              tileColor: Colors.amber,
              leading: Icon(Icons.maps_ugc_outlined, color: Colors.black,),
              title: Text('ChatBot', style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),),
              onTap: (){
                Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => MyHomePage()));
              },
            ),
             ListTile(
              tileColor: Colors.amber,
              leading: Icon(Icons.person, color: Colors.black,),
              title: Text('Profile', style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),),
              onTap: (){
                Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => ProfileUser()));
              },
            ),
            ListTile(
              tileColor: Colors.amber,
              leading: Icon(Icons.logout, color: Colors.white,),
              title: Text('LogOut', style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),),
              onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Authentication(),
                    ),
                  );
              },
            ),
          ],
        ),
      ),
    );
  }
}