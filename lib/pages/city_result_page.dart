import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utilities/textstyling.dart';

class CityResultPage extends StatefulWidget {
  final locationWeather;

  CityResultPage(this.locationWeather);

  @override
  _CityResultPageState createState() => _CityResultPageState();
}

class _CityResultPageState extends State<CityResultPage> {
  double? currentTemp;
  double? minTemp;
  double? maxTemp;
  double? feelTemp;
  String? cityName;
  String? countryName;
  int? weatherID;

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
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0x35000000),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Text(
                              '$cityName, $countryName',
                              style: locationTextStyle,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${currentTemp?.toStringAsFixed(1)}',
                                    style: mainTempTextStyle,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Text(
                                          '°C',
                                          style: mainTempUnitTextStyle,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        'Min ',
                                        style: subTempNameTextStyle,
                                      ),
                                      Text(
                                        '${minTemp?.toStringAsFixed(1)}°C',
                                        style: subTempValueTextStyle,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        'Feels like ',
                                        style: subTempNameTextStyle,
                                      ),
                                      Text(
                                        '${feelTemp?.toStringAsFixed(1)}°C',
                                        style: subTempValueTextStyle,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        'Max ',
                                        style: subTempNameTextStyle,
                                      ),
                                      Text(
                                        '${maxTemp?.toStringAsFixed(1)}°C',
                                        style: subTempValueTextStyle,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
                    textAlign: TextAlign.right,
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
