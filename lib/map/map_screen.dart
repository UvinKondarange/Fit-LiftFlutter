import 'package:flutter/material.dart';
import 'package:login_signin/map/bloc.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class mapScreen extends StatefulWidget {
  @override
  _mapScreenState createState() => _mapScreenState();
}

class _mapScreenState extends State<mapScreen> {
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void initMarker(specify, specifyId) async {
    var markerIdVal = specifyId;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
        markerId: markerId,
        position:
            LatLng(specify['location'].latitude, specify['location'].longitude),
        infoWindow: InfoWindow(title: 'Gym', snippet: specify['info']));
    setState(() {
      markers[markerId] = marker;
    });
  }

  void initState() {
    getMarkerdata();
    super.initState();
  }

  getMarkerdata() {
    Firestore.instance
        .collection('gym locations')
        .getDocuments()
        .then((myMockData) {
      if (myMockData.documents.isNotEmpty) {
        for (int i = 0; i < myMockData.documents.length; i++) {
          initMarker(myMockData.documents[i].data(),
              myMockData.documents[i].documentID);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Set<Marker> getMarker() {
      return <Marker>[
        Marker(
            markerId: MarkerId('Arc Studio'),
            position: LatLng(6.846286, 79.888438),
            icon: BitmapDescriptor.defaultMarker,
            infoWindow: InfoWindow(title: 'Gym'))
      ].toSet();
    }

    final applicationBloc = Provider.of<ApplicationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Map',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: (applicationBloc.currentLocation == null)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                Container(
                  height: 630.0,
                  child: GoogleMap(
                    gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                      new Factory<OneSequenceGestureRecognizer>(
                        () => new EagerGestureRecognizer(),
                      ),
                    ].toSet(),
                    markers: Set<Marker>.of(markers.values),
                    mapType: MapType.normal,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(applicationBloc.currentLocation.latitude,
                            applicationBloc.currentLocation.longitude),
                        zoom: 14),
                  ),
                ),
              ],
            ),
    );
  }
}
