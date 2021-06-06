import 'package:flutter/material.dart';
import 'package:login_signin/map/loadmap.dart';
import 'package:login_signin/net/chatbot.dart';
import 'package:login_signin/ui/gymview.dart';
import 'package:login_signin/ui/profile.dart';
import 'package:login_signin/ui/updatedhome.dart';

class NewHome extends StatefulWidget {
  @override
  _NewHomeState createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    updatedHome(),
    loadMap(),
    gymView(),
    MyHomePage(),
    ProfileUser(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.amber,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text(
              'Home',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on_outlined,
            ),
            title: Text(
              'Near Me',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wallet_membership,
            ),
            title: Text(
              'Gyms',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.maps_ugc_outlined),
            title: Text(
              'ChatBot',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            title: Text(
              'Profile',
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedFontSize: 13.0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[700],
        unselectedFontSize: 13.0,
      ),
    );
  }
}
