import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';
import 'dart:convert';
import 'package:weather_app/access/keys.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': latitude?.toStringAsFixed(3),
      'lon': longitude?.toStringAsFixed(3),
      'appid': weatherAPIKey
    });

    Networking networking = Networking(apiURL: url);

    var weatherData = await networking.getWeatherData();
    print(weatherData);

    // double currentTemp = weatherData['main']['temp'] - 273.15;
    // String cityName = weatherData['name'];
    // int weatherID = weatherData['weather'][0]['id'];
    // print(
    //     '$cityName, ${currentTemp.toStringAsFixed(2)}, ${weatherID.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if ((latitude != null) && (longitude != null))
              Text("LAT: $latitude, LNG: $longitude"),
            // ElevatedButton(
            //   onPressed: () async {
            //     await getLocation().then(
            //       (Position position) => setState(() {
            //         _currentPosition = position;
            //       }),
            //     );
            //   },
            //   child: Text('Get Location'),
            // ),
          ],
        ),
      ),
    );
  }
}
