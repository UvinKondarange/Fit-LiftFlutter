import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class viewUsers extends StatefulWidget {
  @override
  _viewUsersState createState() => _viewUsersState();
}

class _viewUsersState extends State<viewUsers> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Registered Users',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("get").snapshots(),
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
                            text: 'Display Name',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.black)),
                        TextSpan(text: ' '),
                      ],
                    ),
                  ),
                  Text(document['displayName']),
                  RichText(
                    text: TextSpan(
                      text: ' ',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Email',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.black)),
                        TextSpan(text: ' '),
                      ],
                    ),
                  ),
                  Text(document['email']),
                  RichText(
                    text: TextSpan(
                      text: ' ',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Height',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.black)),
                        TextSpan(text: ' '),
                      ],
                    ),
                  ),
                  Text(document['height']),
                  RichText(
                    text: TextSpan(
                      text: ' ',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Weight',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.black)),
                        TextSpan(text: ' '),
                      ],
                    ),
                  ),
                  Text(document['weight']),
                  SizedBox(height: 30),
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
