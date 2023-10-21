import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Models/weather_model.dart';
import 'package:weatherapp/Pages/search_page.dart';
import 'package:weatherapp/Providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return SearchPage();
                    },
                  ));
                },
                icon: const Icon(Icons.search)),
          ],
          title: const Text("Weather App"),
        ),
        body: weatherData == null
            ? const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'there is no weather 😔 start',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'searching now 🔍',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    )
                  ],
                ),
              )
            : Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    weatherData!.getThemColor(),
                    weatherData!.getThemColor()[300]!,
                    weatherData!.getThemColor()[100]!
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 3,
                    ),
                    Text(Provider.of<WeatherProvider>(context).cityName!,
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold)),
                    Text(
                      'updated at : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(weatherData!.getImage()),
                        Text(weatherData!.temp.toInt().toString(),
                            style: const TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold)),
                        Column(
                          children: [
                            Text("maxTemp : ${weatherData!.maxTemp.toInt()}"),
                            Text("minTemp : ${weatherData!.minxTemp.toInt()}"),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    Text(weatherData!.weatherStateName,
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold)),
                    const Spacer(
                      flex: 6,
                    ),
                  ],
                ),
              ));
  }
}
