import 'package:flutter/material.dart';
import 'package:login_signin/admin/adminnewhome.dart';
import 'package:login_signin/net/flutterfire.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:login_signin/ui/authentication.dart';

class adminLogin extends StatefulWidget {
  @override
  _adminLoginState createState() => _adminLoginState();
}

class _adminLoginState extends State<adminLogin> {
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
    return Scaffold(
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

                      bool shouldNavigate =
                          await signIn(_emailField.text, _passwordField.text);
                      if (shouldNavigate) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => adminNewHome(),
                          ),
                        );
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
                      'User Login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Authentication()),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
