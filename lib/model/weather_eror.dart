import 'package:summer_iti_http/model/BaseResponse.dart';

class WeatherError extends WeatherBaseResponse{
  bool? success;
  Error? error;

  WeatherError.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = Error.fromJson(json['error']);
  }
}

class Error {
  String? info;

  Error.fromJson(Map<String, dynamic> json) {
    info = json['info'];
  }
  Map<String,dynamic> toJson(){
    return {'info':info};
  }
}
