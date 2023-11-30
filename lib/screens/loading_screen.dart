

import 'package:flutter/material.dart';
import 'package:clima/locationClass.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocation();
    super.initState();
  }

  void getLocation()async{

    Location location=Location();

    await location.getCurrentLocation();
print(location.logitude);
print(location.fake);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
