import 'package:flutter/material.dart';
import 'package:weatherapp/Models/weather_model.dart';
import 'package:weatherapp/Providers/weather_provider.dart';
import 'package:weatherapp/pages/home_page.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch:
              Provider.of<WeatherProvider>(context).weatherData == null
                  ? Colors.blue
                  : Provider.of<WeatherProvider>(context)
                      .weatherData!
                      .getThemColor()),
      home: HomePage(),
    );
  }
}
