import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 50.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 50.0,
);

const kInputDecoration=InputDecoration(
hintText: 'enter a city',
hintStyle: TextStyle(color: Colors.grey),
filled: true,
fillColor: Colors.white,
icon: Icon(Icons.location_city,color: Colors.white,),
border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
);
