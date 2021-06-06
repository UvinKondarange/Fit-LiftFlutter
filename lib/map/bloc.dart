import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:login_signin/map/geolocator.dart';


class ApplicationBloc with ChangeNotifier{

  final geoLocatorService = GeolocatorService();

  Position currentLocation;

  ApplicationBloc(){
    setCurrentLocation();
  }

  setCurrentLocation() async{
    currentLocation = await geoLocatorService.getCurrentLocation();
    notifyListeners();
  }
}