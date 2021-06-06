import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class chestAdd extends StatefulWidget {
  @override
  _chestAddState createState() => _chestAddState();
}

class _chestAddState extends State<chestAdd> {
  final Color primaryColor = Colors.white;
  final Color secondaryColor = Colors.amber;
  final Color logoGreen = Color(0xff25bcbb);

  TextEditingController nameController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  Map<String, dynamic> producttoAdd;
  CollectionReference collectionReference =
      Firestore.instance.collection('workout plans');

  addProduct() {
    producttoAdd = {
      'name': nameController.text,
      'detail': detailsController.text,
      'img': imageUrlController.text,
    };

    collectionReference.add(producttoAdd).whenComplete(() => print('Added'));
  }

  _buildTextField(TextEditingController controller, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white, border: Border.all(color: Colors.amber)),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            border: InputBorder.none),
      ),
    );
  }

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Add Chest Exercise',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 10),
            _buildTextField(nameController, 'Name'),
            SizedBox(height: 20),
            _buildTextField(detailsController, 'Details'),
            SizedBox(height: 20),
            _buildTextField(imageUrlController, 'Image'),
            SizedBox(height: 20),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: Colors.amber)),
              onPressed: () {
                addProduct();
              },
              child: Text(
                'Add Chest Exercise',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 15),
              ),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
