import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  double? currentLatitude;
  double? currentLongitude;

  void initState() {
    super.initState();
    getLocation();
    // getLocation().then((Position position) => setState(() {
    //       _currentPosition = position;
    //     }));
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    currentLatitude = location.latitude;
    currentLongitude = location.longitude;

    print(location.latitude);
    print(location.longitude);
  }

  //
  // _getCurrentLocation() {
  //   Geolocator.getCurrentPosition(
  //           desiredAccuracy: LocationAccuracy.best,
  //           forceAndroidLocationManager: true)
  //       .then((Position position) {
  //     setState(() {
  //       _currentPosition = position;
  //     });
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if ((currentLatitude != null) && (currentLongitude != null))
              Text("LAT: $currentLatitude, LNG: $currentLongitude"),
            ElevatedButton(
              onPressed: () {
                //        async {
                //   await getLocation().then((Position position) => setState(() {
                //         _currentPosition = position;
                //       }));
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
