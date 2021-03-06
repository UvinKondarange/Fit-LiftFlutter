import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> userSetup(String email, String displayName, String height, String weight) async{
  CollectionReference users = FirebaseFirestore.instance.collection("Users");
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.add({
    'email': email,
    'displayName': displayName,
    'height': height,
    'uid': uid,
    'weight': weight 
  });
  return;
}
  
 