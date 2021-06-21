import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Position? _currentPosition;

  void initState() {
    super.initState();
    getLocation().then((Position position) => setState(() {
          _currentPosition = position;
        }));
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }

  Future<Position> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low,
            forceAndroidLocationManager: true)
        .timeout(Duration(seconds: 10));
    // print('$position.altitude, $position.latitude');
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_currentPosition != null)
              Text(
                  "LAT: ${_currentPosition?.latitude}, LNG: ${_currentPosition?.longitude}"),
            ElevatedButton(
              onPressed: () async {
                await getLocation().then((Position position) => setState(() {
                      _currentPosition = position;
                    }));
                // var myres = await getLocation();
                // print(myres);
                // String result = await testAsync();
                // _getCurrentLocation();
                // print(result);
                // print(pos);
              },
              child: Text('Get Location'),
            ),
          ],
        ),
      ),
    );
  }
}
