import 'package:flutter/material.dart';
import 'package:summer_iti_http/data/remote/api_services.dart';
import 'package:summer_iti_http/model/weather_eror.dart';

import 'model/weather.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  Weather? _weather;
  String? _message;
  List<String> cities = ['New York', 'Cairo', 'San Francisco', 'Almansourah'];
  String city = 'New York';
  @override
  Widget build(BuildContext context) {
    getWeather(city);
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        centerTitle: true,
      ),
      body: Center(
        child: _weather != null
            ? Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                reusedDropDown(),
                SizedBox(
                  height: 30,
                ),
                Text('${_weather!.location!.name}'),
                Text('${_weather!.current!.temperature}'),
                Image.network('${_weather!.current!.weather_icons![0]}'),
                Text('${_weather!.current!.weather_descriptions![0]}'),
              ])
            : Column(
                children: [
                  reusedDropDown(),
                  Text('$_message'),
                ],
              ),
      ),
    );
  }

  void getWeather(String cityName) {
    try {
      ApiServices().getWeather(cityName).then((value) {
        setState(() {
          if (value is Weather) _weather = value;
          if (value is WeatherError) _message = value.error!.info;
        });
      });
    } catch (e) {
      setState(() {
        _message = e.toString();
      });
    }
  }

  Widget reusedDropDown() {
    return DropdownButton<String>(
      value: city,
      items: cities
          .map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          city = value!;
        });
      },
    );
  }
}
