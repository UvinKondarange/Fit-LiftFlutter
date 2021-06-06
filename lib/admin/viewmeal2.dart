import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class viewDinnerPlans extends StatefulWidget {
  @override
  _viewDinnerPlansState createState() => _viewDinnerPlansState();
}

class _viewDinnerPlansState extends State<viewDinnerPlans> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'View Dinner Meals',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection("meal plans2").snapshots(),
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
                            text: 'Type',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.black)),
                        TextSpan(text: ' '),
                      ],
                    ),
                  ),
                  Text(document['name']),
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
                  Text(document['detail']),
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
                  //Text(document['img']),
                  Image.network(document['img']),
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
