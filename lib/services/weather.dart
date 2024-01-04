import 'package:clima/locationClass.dart';
import 'package:clima/services/networking.dart';

const apiKey='a837297916eba4f48d3bf304d4fd010b';
String openWeatherMapUrl='https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
Future<dynamic> getLocationWeather()async{
   Location location = Location(); 

    await location.getCurrentLocation();

   NetworkHelper networkHelper=await NetworkHelper(url: '$openWeatherMapUrl?lat=${location.latitude}&lon=${location.logitude}&appid=$apiKey&units=metric');
    var weatherData=await networkHelper.getData(latitude: location.latitude, longitude: location.logitude);
    print("$weatherData - weatherDataRefresh");
return weatherData;
}

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) { 
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
