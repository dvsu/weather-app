import 'package:flutter/material.dart';
import 'package:weather_app/utilities/textstyling.dart';
import 'package:weather_app/utilities/color_palette.dart';

class MainTempWidgetLarge extends StatelessWidget {
  const MainTempWidgetLarge({
    required this.cityName,
    required this.countryName,
    required this.currentTemp,
    required this.minTemp,
    required this.feelTemp,
    required this.maxTemp,
  });

  final String? cityName;
  final String? countryName;
  final double? currentTemp;
  final double? minTemp;
  final double? feelTemp;
  final double? maxTemp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: widgetBackgroundColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: (cityName != null && countryName != null)
                    ? Text(
                        '$cityName, $countryName',
                        style: locationTextStyle,
                      )
                    : Text(
                        'Location unknown',
                        style: locationTextStyle,
                      ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (currentTemp == null)
                          ? Text(
                              '0.0',
                              style: mainTempTextStyle,
                            )
                          : Text(
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
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SubTempWidget(
                        widgetName: 'Min',
                        widgetValue: minTemp ?? 0.0,
                      ),
                      SubTempWidget(
                        widgetName: 'Feels like',
                        widgetValue: feelTemp ?? 0.0,
                      ),
                      SubTempWidget(
                        widgetName: 'Max',
                        widgetValue: maxTemp ?? 0.0,
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
        Expanded(
          flex: 1,
          child: Text(
            widgetName,
            style: subTempNameTextStyle,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            '${widgetValue.toStringAsFixed(1)}°C',
            style: subTempValueTextStyle,
          ),
        ),
      ],
    );
  }
}

class TempWidgetMedium extends StatelessWidget {
  const TempWidgetMedium(
      {required this.widgetTitle, required this.widgetContent});

  final String widgetTitle;
  final Widget widgetContent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
            color: widgetBackgroundColor,
            borderRadius: BorderRadius.circular(20.0)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      widgetTitle,
                      style: widgetTitleTextStyle,
                    ),
                  )),
              Expanded(
                flex: 1,
                child: Divider(
                  thickness: 2.0,
                  color: widgetDividerColor,
                ),
              ),
              Expanded(
                flex: 8,
                child: Center(
                  child: widgetContent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
