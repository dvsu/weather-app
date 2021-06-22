import 'package:flutter/material.dart';
import 'package:weather_app/pages/city_result_page.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';
import 'package:weather_app/access/keys.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/utilities/textstyling.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    double? latitude = location.latitude;
    double? longitude = location.longitude;

    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': latitude?.toStringAsFixed(4),
      'lon': longitude?.toStringAsFixed(4),
      'units': 'metric',
      'appid': weatherAPIKey
    });

    Networking networking = Networking(apiURL: url);

    var weatherData = await networking.getWeatherData();

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => CityResultPage(weatherData)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SpinKitChasingDots(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? Color(0xffededed) : Color(0xffababab),
                    shape: BoxShape.circle,
                  ),
                );
              },
              size: 80.0,
              duration: Duration(milliseconds: 1500),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Gathering weather data information...',
                textAlign: TextAlign.center,
                style: loadingPageTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
