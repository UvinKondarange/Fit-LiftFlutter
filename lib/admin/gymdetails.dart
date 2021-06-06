import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class gymDetails extends StatefulWidget {
  @override
  _gymDetailsState createState() => _gymDetailsState();
}

class _gymDetailsState extends State<gymDetails> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Gym Details',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("gym info").snapshots(),
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
                                fontSize: 15.0,
                                color: Colors.black)),
                        TextSpan(text: ''),
                      ],
                    ),
                  ),
                  Text(document['name']),
                  SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: ' ',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Details',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.black)),
                        TextSpan(text: ' '),
                      ],
                    ),
                  ),
                  Text(document['Details']),
                  SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: ' ',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Image',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.black)),
                        TextSpan(text: ' '),
                      ],
                    ),
                  ),
                  Image.network(document['img']),
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
