import 'package:geolocator/geolocator.dart';

class Location{
  double? latitude;
  double? logitude;
  String fake='fake';


  Future<void> getCurrentLocation()async{
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude=position.latitude;
      logitude=position.longitude;
    }catch(e){
      print(e.toString());
    }

  }
}