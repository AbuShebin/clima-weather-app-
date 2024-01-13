import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class LocationScreen extends StatefulWidget {

 final weatherData;

  LocationScreen({required this.weatherData});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
 int? temperature;
  int? condition;
  String? cityName;
  var conditionIcon;
  var temperatureMessage;

  updateUIWeather({var weatherData}){
     try{
      print(weatherData);
    setState(() {
      WeatherModel weatherModel =WeatherModel();
      double temp = weatherData['main']['temp'];
      temperature=temp.toInt();
      cityName =weatherData['name'];
      condition = weatherData['weather'][0]['id'];
      print("$condition -condition");
      conditionIcon = weatherModel.getWeatherIcon(condition!);

      temperatureMessage=weatherModel.getMessage(temperature!);
    });
      }catch(e){
        print(e);
      }
    print("$weatherData-weather data");
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initstate=========================");
    updateUIWeather(weatherData: widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      // WeatherModel().getLocationWeather();
                      print('hi');
                      print(cityName??'new york');
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async{
                      print(1);
                     var cityName=await Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return CityScreen();
                      }));
                      print("2");
                      print(cityName??'no city');
                      if(cityName!=null){
                        print("hello worlsd");
                        WeatherModel weather=WeatherModel();
                       var weatherData=await weather.getCityWeather(cityName);
                       print(weatherData);
                        updateUIWeather(weatherData: weatherData);
                        print(cityName); 
                      }
                      print("3");
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      conditionIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$temperatureMessage in $cityName",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
