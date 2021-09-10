import 'dart:convert';

import 'package:http/http.dart';
import 'package:summer_iti_http/data/Constants.dart';
import 'package:http/http.dart' as http;
import 'package:summer_iti_http/model/BaseResponse.dart';
import 'package:summer_iti_http/model/base_exception.dart';
import 'package:summer_iti_http/model/weather.dart';
import 'package:summer_iti_http/model/weather_eror.dart';

class ApiServices {
  static ApiServices? _apiServices;

  ApiServices._instance();

  factory ApiServices() {
    if (_apiServices == null) {
      _apiServices = ApiServices._instance();
    }
    return _apiServices!;
  }

  Future<WeatherBaseResponse> getWeather(String cityName) async {
    String url =
        "${Constants.BASE_URL}/current?access_key=${Constants.API_KEY}&query=$cityName";
    Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String body = response.body;
      try {
        return Weather.fromJson(jsonDecode(body));
      } catch (e) {
        return WeatherError.fromJson(jsonDecode(body));
      }
    } else {
      throw BaseException.statusCode(response.statusCode);
    }
  }
}
