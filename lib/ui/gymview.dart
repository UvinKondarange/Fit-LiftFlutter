import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class gymView extends StatefulWidget {
  @override
  _gymViewState createState() => _gymViewState();
}

class _gymViewState extends State<gymView> {
  void _launchUrl(String Url) async {
    if (await canLaunch(Url)) {
      await launch(Url);
    } else {
      throw 'Could not open url';
    }
  }

  void _launchCaller(int number) async {
    var url = 'tel:${number.toString()}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not place call';
    }
  }

  void _launchEmail(String emailId) async {
    var url = "mailto:$emailId?subject= Regarding...";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not send mail';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: Text(
          'Gym Info',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('gym info').snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              DocumentSnapshot workout = snapshot.data.documents[index];
              return Container(
                child: ListTile(
                  leading: Image.network(
                    workout['img'],
                    height: 100,
                    width: 100,
                  ),
                  title: Text(
                    workout['name'],
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    children: <Widget>[
                      Text(
                        workout['Details'],
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(color: Colors.amber)),
                            onPressed: () {
                              _launchCaller(0112710700);
                            },
                            child: Text('Call',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(color: Colors.amber)),
                            onPressed: () {
                              _launchEmail('arcstudiofitness@gmail.com');
                            },
                            child: Text('Mail',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
