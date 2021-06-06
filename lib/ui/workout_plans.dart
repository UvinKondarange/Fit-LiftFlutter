import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class alldata extends StatefulWidget {
  @override
  _alldataState createState() => _alldataState();
}

class _alldataState extends State<alldata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'View Chest Exercises',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection("workout plans").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return ListView(
            children: snapshot.data.docs.map((document) {
              return Column(
                children: [
                  SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: ' ',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Name',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.black)),
                        TextSpan(text: ' '),
                      ],
                    ),
                  ),
                  Text(
                    document['name'],
                    style: TextStyle(fontSize: 15.0),
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: ' ',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Details',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.black)),
                        TextSpan(text: ' '),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      document['detail'],
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: ' ',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: '',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.black)),
                        TextSpan(text: ' '),
                      ],
                    ),
                  ),
                  Image.network(
                    document['img'],
                    height: 200,
                    width: 200,
                  ),
                  SizedBox(height: 20),
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
