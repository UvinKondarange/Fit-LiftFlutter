import 'package:flutter/material.dart';
import 'package:login_signin/map/map_screen.dart';
import 'package:provider/provider.dart';
import 'package:login_signin/map/bloc.dart';

class loadMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return ChangeNotifierProvider(
      create: (context) => ApplicationBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: mapScreen(),
      ),
    );
  }
}