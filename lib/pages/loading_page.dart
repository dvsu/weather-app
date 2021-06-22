import 'package:flutter/material.dart';
import 'package:weather_app/services/weather.dart';
import 'package:weather_app/pages/city_result_page.dart';
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
    var weatherData;
    WeatherModel weatherModel = WeatherModel();
    weatherData = await weatherModel.getWeatherData();
    print('in loading page $weatherData');
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
