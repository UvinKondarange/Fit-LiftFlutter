import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class updateGymDetails extends StatefulWidget {
  @override
  _updateGymDetailsState createState() => _updateGymDetailsState();
}

class _updateGymDetailsState extends State<updateGymDetails> {
  final Color primaryColor = Color(0xff18203d);
  final Color secondaryColor = Color(0xff232c51);
  final Color logoGreen = Color(0xff25bcbb);

  bool loading = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

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
            labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
            border: InputBorder.none),
      ),
    );
  }

  CollectionReference ref = Firestore.instance.collection('gym info');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Update Gym Info',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.grey,
      body: StreamBuilder(
        stream: ref.snapshots(),
        builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  var doc = snapshot.data.documents[index].data();
                  return ListTile(
                    leading: IconButton(
                      icon: Icon(Icons.edit),
                      color: Colors.black,
                      onPressed: () {
                        nameController.text = doc['name'];
                        detailsController.text = doc['Details'];
                        imageUrlController.text = doc['img'];

                        showDialog(
                            context: context,
                            builder: (context) => Dialog(
                                  child: Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListView(
                                        shrinkWrap: true,
                                        children: [
                                          SizedBox(height: 10),
                                          _buildTextField(
                                              nameController, 'Name'),
                                          SizedBox(height: 20),
                                          _buildTextField(
                                              detailsController, 'Details'),
                                          SizedBox(height: 20),
                                          _buildTextField(
                                              imageUrlController, 'Image'),
                                          SizedBox(height: 20),
                                          FlatButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                side: BorderSide(
                                                    color: Colors.amber)),
                                            child: Text(
                                              'Update Gym Details',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 15.0),
                                            ),
                                            color: Colors.white,
                                            onPressed: () {
                                              snapshot.data.documents[index]
                                                  .reference
                                                  .updateData({
                                                'name': nameController.text,
                                                'Details':
                                                    detailsController.text,
                                                'img': imageUrlController.text,
                                              }).whenComplete(() =>
                                                      Navigator.pop(context));
                                            },
                                          ),
                                          SizedBox(height: 20),
                                          FlatButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                side: BorderSide(
                                                    color: Colors.amber)),
                                            child: Text(
                                              'Delete Gym Details',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 15.0),
                                            ),
                                            color: Colors.white,
                                            onPressed: () {
                                              snapshot.data.documents[index]
                                                  .reference
                                                  .delete();
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                      },
                    ),
                    title: Text(
                      doc['name'],
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Column(
                      children: [
                        Text(
                          doc['Details'],
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    trailing: Image.network(
                      doc['img'],
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  );
                });
          } else {
            return Text('');
          }
        },
      ),
    );
  }
}
