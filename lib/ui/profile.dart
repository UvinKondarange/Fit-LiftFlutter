import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_signin/net/flutterfire.dart';
import 'package:login_signin/ui/authentication.dart';

class ProfileUser extends StatefulWidget {
  @override
  _ProfileUserState createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  String _email;
  String _displayName;
  String _weight;
  String _height;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          centerTitle: true,
          elevation: 0.0,
          title: Text(
            'Profile',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          actions: [
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Logout'),
              onPressed: () async {
                setState(() => loading = true);
                bool shouldNavigate = await signOut();
                if (shouldNavigate) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Authentication(),
                    ),
                  );
                }
              },
            )
          ],
        ),
        body: Container(
          child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('get')
                  .doc(firebaseUser.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text('');
                }

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Center(
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/FitnLift- profile avatar 2.jpg'),
                        maxRadius: 50.0,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: RichText(
                        text: TextSpan(
                          text: ' ',
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                                text: 'UID:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.black)),
                            TextSpan(text: ' '),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        snapshot.data['uid'],
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: RichText(
                        text: TextSpan(
                          text: ' ',
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Name:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.black)),
                            TextSpan(text: ' '),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        snapshot.data['displayName'],
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: RichText(
                        text: TextSpan(
                          text: ' ',
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Email:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.black)),
                            TextSpan(text: ' '),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        snapshot.data['email'],
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: RichText(
                        text: TextSpan(
                          text: ' ',
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Weight:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.black)),
                            TextSpan(text: ' '),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        snapshot.data['weight'],
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: RichText(
                        text: TextSpan(
                          text: ' ',
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Height:',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.black)),
                            TextSpan(text: ' '),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        snapshot.data['height'],
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 20),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(color: Colors.amber)),
                      onPressed: () async {
                        setState(() => loading = true);
                        bool shouldNavigate = await signOut();
                        if (shouldNavigate) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Authentication(),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Logout',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15.0),
                      ),
                      color: Colors.white,
                    ),
                  ],
                );
              }),
        ));
  }
}
