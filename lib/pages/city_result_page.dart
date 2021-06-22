import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utilities/textstyling.dart';
import 'package:weather_app/widgets/main_temp_widget.dart';

class CityResultPage extends StatefulWidget {
  final locationWeather;

  CityResultPage(this.locationWeather);

  @override
  _CityResultPageState createState() => _CityResultPageState();
}

class _CityResultPageState extends State<CityResultPage> {
  double currentTemp = 0.0;
  double minTemp = 0.0;
  double maxTemp = 0.0;
  double feelTemp = 0.0;
  String cityName = '';
  String countryName = '';
  int weatherID = 0;

  @override
  void initState() {
    super.initState();
    updateUIData(widget.locationWeather);
  }

  void updateUIData(dynamic weatherData) {
    currentTemp = weatherData['main']['temp'];
    feelTemp = weatherData['main']['feels_like'];
    minTemp = weatherData['main']['temp_min'];
    maxTemp = weatherData['main']['temp_max'];
    currentTemp = weatherData['main']['temp'];
    cityName = weatherData['name'];
    countryName = weatherData['sys']['country'];
    weatherID = weatherData['weather'][0]['id'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/sunny_day.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.near_me,
                        size: 50.0,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.location_city,
                        size: 50.0,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 7,
                child: MainTempWidget(
                    cityName: cityName,
                    countryName: countryName,
                    currentTemp: currentTemp,
                    minTemp: minTemp,
                    feelTemp: feelTemp,
                    maxTemp: maxTemp),
              ),
              Expanded(
                flex: 4,
                child: Container(),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text(
                    "It's sunny in $cityName",
                    textAlign: TextAlign.center,
                    style: kMessageTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
