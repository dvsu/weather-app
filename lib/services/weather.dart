import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';
import 'package:weather_app/access/keys.dart';

class WeatherModel {
  Future<dynamic> getWeatherDataByLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    double? latitude = location.latitude;
    double? longitude = location.longitude;

    if (latitude == null || longitude == null) {
      return null;
    }

    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': latitude.toStringAsFixed(4),
      'lon': longitude.toStringAsFixed(4),
      'units': 'metric',
      'appid': weatherAPIKey
    });

    Networking networking = Networking(apiURL: url);

    return await networking.getWeatherData();
  }

  Future<dynamic> getWeatherDataByCityName(String cityName) async {
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather',
        {'q': cityName, 'units': 'metric', 'appid': weatherAPIKey});

    Networking networking = Networking(apiURL: url);

    return await networking.getWeatherData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getWeatherImage(int condition) {
    if (condition < 300) {
      return 'images/thunderstorm.jpg';
    } else if (condition < 400) {
      return 'images/drizzle.jpg';
    } else if (condition < 600) {
      return 'images/rain.jpg';
    } else if (condition < 700) {
      return 'images/snow.jpg';
    } else if (condition < 800) {
      return 'images/default.jpg';
    } else if (condition == 800) {
      return 'images/sunny_day.jpg';
    } else if (condition <= 804) {
      return 'images/cloudy.jpg';
    } else {
      return 'images/default.jpg';
    }
  }

  String getMessage(double? temp) {
    if (temp == null) {
      return '';
    }

    int tempInt = temp.toInt();

    if (tempInt > 25) {
      return 'It\'s 🍦 time';
    } else if (tempInt > 20) {
      return 'Time for shorts and 👕';
    } else if (tempInt < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
