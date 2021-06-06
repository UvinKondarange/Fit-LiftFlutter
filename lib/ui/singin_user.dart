import 'package:login_signin/net/flutterfire.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_signin/icon/loading.dart';
import 'package:login_signin/net/sign_in.dart';
import 'package:login_signin/ui/authentication.dart';
import 'package:login_signin/ui/newhome.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class userSignin extends StatefulWidget {
  @override
  _userSigninState createState() => _userSigninState();
}

class _userSigninState extends State<userSignin> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  TextEditingController _displayName = TextEditingController();
  TextEditingController _height = TextEditingController();
  TextEditingController _weight = TextEditingController();

  void validate() {
    if (formkey.currentState.validate()) {
      print('validated');
    } else {
      print('not validated');
    }
  }

  String validatepass(value) {
    if (value.isEmpty) {
      return 'Required';
    } else if (value.length < 6) {
      return 'Should be 6 characters';
    } else if (value.length > 10) {
      return 'Should not be more than 10 characters';
    } else {
      return null;
    }
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/FitnLift-13.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Form(
                autovalidate: true,
                key: formkey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 100),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Required'),
                            EmailValidator(errorText: 'Email not valid'),
                          ]),
                          style: TextStyle(color: Colors.white),
                          controller: _emailField,
                          decoration: InputDecoration(
                            hintText: "something@email.com",
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                            labelText: "Email",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 35),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: TextFormField(
                          validator: validatepass,
                          style: TextStyle(color: Colors.white),
                          controller: _passwordField,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "password",
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                            labelText: "Password",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 35),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: _displayName,
                          decoration: InputDecoration(
                            hintText: "user name",
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                            labelText: "User Name",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 35),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: _height,
                          decoration: InputDecoration(
                            hintText: "height",
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                            labelText: "Height",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 35),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: TextFormField(
                          //validator: validatepass,
                          style: TextStyle(color: Colors.white),
                          controller: _weight,
                          //obscureText: true,
                          decoration: InputDecoration(
                            hintText: "weight",
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                            labelText: "Weight",
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 35),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.4,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.amber,
                        ),
                        child: MaterialButton(
                          onPressed: () async {
                            setState(() => loading = true);

                            bool shouldNavigate = await register(
                                _emailField.text, _passwordField.text);

                            var firebaseUser =
                                FirebaseAuth.instance.currentUser;
                            FirebaseFirestore.instance
                                .collection("get")
                                .doc(firebaseUser.uid)
                                .set({
                              "email": _emailField.text,
                              "displayName": _displayName.text,
                              "height": _height.text,
                              "weight": _weight.text,
                              "uid": FirebaseAuth.instance.currentUser.uid
                                  .toString(),
                            }).then((_) {
                              print("success!");
                            });

                            if (shouldNavigate) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewHome(),
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 35),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Authentication()));
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.amber),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 35),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SignInButton(
                            Buttons.Google,
                            onPressed: () {
                              currentUser().then((result) {
                                if (result != null) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return NewHome();
                                      },
                                    ),
                                  );
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
