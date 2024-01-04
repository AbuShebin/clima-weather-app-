import 'package:clima/main.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/locationClass.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

  const apiKey='a837297916eba4f48d3bf304d4fd010b';
  String openweathermapUrl='https://api.openweathermap.org/data/2.5/weather';

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

  void getLocation() async {
  
    var weatherData=await WeatherModel().getLocationWeather();

    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherData: weatherData,);
    },));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor:  Colors.indigo[400],
      body: Center(
        child:  SpinKitDoubleBounce(size: 100,color: Colors.white,),
      ),
    );
  }
}
