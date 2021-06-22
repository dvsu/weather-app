import 'package:flutter/material.dart';
import 'package:weather_app/utilities/textstyling.dart';

class MainTempWidget extends StatelessWidget {
  const MainTempWidget({
    required this.cityName,
    required this.countryName,
    required this.currentTemp,
    required this.minTemp,
    required this.feelTemp,
    required this.maxTemp,
  });

  final String cityName;
  final String countryName;
  final double currentTemp;
  final double minTemp;
  final double feelTemp;
  final double maxTemp;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${currentTemp.toStringAsFixed(1)}',
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SubTempWidget(
                        widgetName: 'Min',
                        widgetValue: minTemp,
                      ),
                      SubTempWidget(
                        widgetName: 'Feels like',
                        widgetValue: feelTemp,
                      ),
                      SubTempWidget(
                        widgetName: 'Max',
                        widgetValue: maxTemp,
                      ),
                    ],
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

class SubTempWidget extends StatelessWidget {
  final String widgetName;
  final double widgetValue;

  SubTempWidget({required this.widgetName, required this.widgetValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          widgetName,
          style: subTempNameTextStyle,
        ),
        Text(
          '${widgetValue.toStringAsFixed(1)}°C',
          style: subTempValueTextStyle,
        ),
      ],
    );
  }
}
