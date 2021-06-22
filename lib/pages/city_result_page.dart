import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utilities/color_palette.dart';
import 'package:weather_app/utilities/textstyling.dart';
import 'package:weather_app/widgets/temp_widget.dart';
import 'package:weather_app/services/weather.dart';

class CityResultPage extends StatefulWidget {
  final locationWeather;

  CityResultPage(this.locationWeather);

  @override
  _CityResultPageState createState() => _CityResultPageState();
}

class _CityResultPageState extends State<CityResultPage> {
  WeatherModel weatherModel = WeatherModel();
  double currentTemp = 0.0;
  double minTemp = 0.0;
  double maxTemp = 0.0;
  double feelTemp = 0.0;
  double humidity = 0.0;
  String cityName = '';
  String countryName = '';
  int weatherID = 0;
  String weatherIcon = '';
  String weatherMessage = '';
  bool locationDisabled = false;
  String weatherImage = 'images/default.jpg';

  @override
  void initState() {
    super.initState();
    updateUIData(widget.locationWeather);
  }

  void updateUIData(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        locationDisabled = true;
        return;
      }
      locationDisabled = false;
      currentTemp = weatherData['main']['temp'].toDouble();
      feelTemp = weatherData['main']['feels_like'].toDouble();
      minTemp = weatherData['main']['temp_min'].toDouble();
      maxTemp = weatherData['main']['temp_max'].toDouble();
      humidity = weatherData['main']['humidity'].toDouble();
      cityName = weatherData['name'] ?? '';
      countryName = weatherData['sys']['country'] ?? '';
      weatherID = weatherData['weather'][0]['id'];
      weatherIcon = weatherModel.getWeatherIcon(weatherID);
      weatherImage = weatherModel.getWeatherImage(weatherID);
      weatherMessage = weatherModel.getMessage(currentTemp.toInt());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(weatherImage),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 0.0,
                          vertical: 5.0,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              updateUIData(await weatherModel.getWeatherData());
                            },
                            child: Icon(
                              Icons.near_me,
                              size: 30.0,
                            ),
                            style: ButtonStyle(
                              alignment: Alignment.center,
                              backgroundColor: MaterialStateProperty.all(
                                  buttonBackgroundColor),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 0.0,
                          vertical: 5.0,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.location_city,
                              size: 30.0,
                            ),
                            style: ButtonStyle(
                              alignment: Alignment.center,
                              backgroundColor: MaterialStateProperty.all(
                                  buttonBackgroundColor),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(20.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 8,
                child: MainTempWidgetLarge(
                    cityName: cityName,
                    countryName: countryName,
                    currentTemp: currentTemp,
                    minTemp: minTemp,
                    feelTemp: feelTemp,
                    maxTemp: maxTemp),
              ),
              Expanded(
                flex: 5,
                child: TempWidgetMedium(
                  widgetTitle: '6-day Forecast',
                  widgetContent: Text(''),
                ),
              ),
              Expanded(
                flex: 5,
                child: TempWidgetMedium(
                  widgetTitle: 'Quick Insights',
                  widgetContent: (locationDisabled == false)
                      ? Text(
                          "It's $weatherIcon in $cityName\n$weatherMessage",
                          textAlign: TextAlign.center,
                          style: weatherInsightsTextStyle,
                        )
                      : Text(
                          "Unable to fetch weather data\nEnsure the GPS is on.",
                          textAlign: TextAlign.center,
                          style: weatherInsightsTextStyle,
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
