import 'package:summer_iti_http/model/BaseResponse.dart';

class Weather extends WeatherBaseResponse {
  Request? request;
  Current? current;
  Location? location;
  bool? success;
  Error? error;

  Map<String, dynamic> toJson() {
    return {
      'request': request?.toJson(),
      'current': current?.toJson(),
      'location': location?.toJson(),
    };
  }

  Weather.fromJson(Map<String, dynamic> json) {
    request = Request.fromJson(json['request']);
    current = Current.fromJson(json['current']);
    location = Location.fromJson(json['location']);
  }
}

class Request {
  String? query;

  Map<String, dynamic> toJson() {
    return {'query': query};
  }

  Request.fromJson(Map<String, dynamic> json) {
    query = json['query'];
  }
}

class Current {
  int? temperature;
  List<dynamic>? weather_icons;
  List<dynamic>? weather_descriptions;

  Map<String, dynamic> toJson() {
    return {
      'temperature': temperature,
      'weather_icons': weather_icons,
      'weather_descriptions': weather_descriptions
    };
  }

  Current.fromJson(Map<String, dynamic> json) {
    temperature = json['temperature'];
    weather_icons = json['weather_icons'];
    weather_descriptions = json['weather_descriptions'];
  }
}

class Location {
  String? name;
  String? country;
  String? region;
  String? lat;
  String? lon;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'country': country,
      'region': region,
      'lat': lat,
      'lon': lon
    };
  }

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    country = json['country'];
    region = json['region'];
    lat = json['lat'];
    lon = json['lon'];
  }
}
