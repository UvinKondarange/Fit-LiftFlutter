import 'package:login_signin/admin/adminlogin.dart';
import 'package:login_signin/net/flutterfire.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:login_signin/icon/loading.dart';
import 'package:login_signin/ui/reset.dart';
import 'package:login_signin/ui/singin_user.dart';
import 'newhome.dart';

class Authentication extends StatefulWidget {
  Authentication({Key key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                      width: MediaQuery.of(context).size.width / 1.4,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.amber,
                      ),
                      child: MaterialButton(
                          onPressed: () async {
                            setState(() => loading = true);

                            bool shouldNavigate = await signIn(
                                _emailField.text, _passwordField.text);
                            if (shouldNavigate) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewHome(),
                                ),
                              );
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('An error Occured'),
                                      content: Text('Invalid Credentials!'),
                                      actions: [
                                        new FlatButton(
                                          child: Text('Okey'),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        Authentication()));
                                          },
                                        )
                                      ],
                                    );
                                  });
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => ResetScreen()),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          child: Text(
                            'Admin Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => adminLogin()),
                          ),
                        ),
                      ],
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    userSignin()));
                      },
                      child: Text(
                        'Signup',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.amber),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
